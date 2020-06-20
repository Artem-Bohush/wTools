( function _Err_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{
  let _ = require( '../Layer1.s' );
  _.include( 'wTesting' );
}

let _ = _global_.wTools;
let fileProvider = _testerGlobal_.wTools.fileProvider;
let path = fileProvider.path;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  self.suiteTempPath = path.pathDirTempOpen( path.join( __dirname, '../..'  ), 'err' );
  self.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/err-' ) )
  path.pathDirTempClose( self.suiteTempPath );
}

// --
// tests
// --

function diagnosticStructureGenerate( test )
{

  test.case = 'implicity call';
  var got = _.diagnosticStructureGenerate();
  test.is( _.mapIs( got.structure ) );
  test.identical( got.structure[ 'number.big' ], 1 << 30 );
  test.is( _.numberIs( got.size ) );

  test.case = 'defaultComplexity : 5, depth : 3';
  var got = _.diagnosticStructureGenerate({ defaultComplexity : 5, depth : 3 });
  test.is( _.mapIs( got.structure ) );
  test.is( _.hashMapIs( got.structure.hashmap ) );
  test.is( _.setIs( got.structure.set ) );

}

diagnosticStructureGenerate.timeOut = 50000;

//

function errArgumentObject( test )
{
  let context = this;
  let visited = [];

  var args = [ 'str', { num : 1 } ];
  var err = _._err({ args });
  test.is( _.errIs( err ) );

  var errStr = String( err );
  console.log( errStr );
  test.identical( _.strCount( errStr, 'at Object.errArgumentObject' ), 2 );
  test.identical( _.strCount( errStr, '* 68 :   var err = _._err({ args });' ), 1 );

}

//

function errFromStringedError( test )
{
  let context = this;
  let visited = [];

  var msg =
`
Uncaught Error:  = Message of error#1
No source file found for "W1.js"
Error including source file /workerEnvironment/Worker.js

 = Beautified calls stack
at Object._broInclude (http://127.0.0.1:15000/.starter:6144:17)
at Object._sourceInclude (http://127.0.0.1:15000/.starter:6575:20)
at SourceFile.Worker_js_naked [as nakedCall] (http://127.0.0.1:15000/workerEnvironment/Worker.js:14:1)
at Object._sourceIncludeAct (http://127.0.0.1:15000/.starter:6529:19)
at Worker_js (http://127.0.0.1:15000/workerEnvironment/Worker.js:27:18)
at http://127.0.0.1:15000/workerEnvironment/Worker.js:28:38

 = Throws stack
thrown at Object._broInclude @ http://127.0.0.1:15000/.starter:6144:17
thrown at Object._sourceIncludeAct @ http://127.0.0.1:15000/.starter:6538:15
`;
  var args = [ msg ];
  var o =
  {
    args,
    level : 1,
    fallBackStack : 'at handleError @ http://127.0.0.1:15000/.starter:2918',
    throwLocation :
    {
      filePath : 'http://127.0.0.1:15000/.starter',
      line : 2918,
      col : 23,
    },
  }
  var err = _._err( o );
  test.is( _.errIs( err ) );

  var exp =
`
= Message of error#${err.id}
    Uncaught Error:
    No source file found for "W1.js"
    Error including source file /workerEnvironment/Worker.js

 = Beautified calls stack
    at Object._broInclude (http://127.0.0.1:15000/.starter:6144:17)
    at Object._sourceInclude (http://127.0.0.1:15000/.starter:6575:20)
    at SourceFile.Worker_js_naked [as nakedCall] (http://127.0.0.1:15000/workerEnvironment/Worker.js:14:1)
    at Object._sourceIncludeAct (http://127.0.0.1:15000/.starter:6529:19)
    at Worker_js (http://127.0.0.1:15000/workerEnvironment/Worker.js:27:18)
    at http://127.0.0.1:15000/workerEnvironment/Worker.js:28:38

 = Throws stack
    thrown at Object._broInclude @ http://127.0.0.1:15000/.starter:6144:17
    thrown at Object._sourceIncludeAct @ http://127.0.0.1:15000/.starter:6538:15
    thrown at Object.errFromStringedError @ ${ o.catchLocation.filePathLineCol }

`
  var got = String( err );
  test.equivalent( got, exp ); debugger;
  test.identical( _.strCount( got, '= Message of error' ), 1 );
  test.identical( _.strCount( got, '= Beautified calls stack' ), 1 );
  test.identical( _.strCount( got, '= Throws stack' ), 1 );

}

//

function _errTrowsError( test )
{
  try
  {
    var err = _._err();
  }
  catch( err )
  {
    test.case = 'without arguments';
    test.is( _.errIs( err ) );
    var errStr = String( err );
    test.identical( _.strCount( errStr, 'Expects single argument : options map' ), 1 );
  }

  /* */

  try
  {
    var err = _._err( { args : 'wrong' } );
  }
  catch( err )
  {
    test.case = 'o.args is not a long';
    test.is( _.errIs( err ) );
    var errStr = String( err );
    test.identical( _.strCount( errStr, '_err : Expects Long option::args' ), 1 );
  }

  /* */

  try
  {
    var err = _._err( { args : [ 'arg' ], wrong : 1 } );
  }
  catch( err )
  {
    test.case = 'map option has unnecessaty fields';
    test.is( _.errIs( err ) );
    var errStr = String( err );
    test.identical( _.strCount( errStr, 'Unknown option::wrong' ), 1 );
  }
}

//

function _errArgsWithMap( test )
{
  test.case = 'map in args, without Error';
  var err = _._err( { args : [ { 'location' : { 'filePath' : 'at program1' }, 'line' : 10, 'col' : 5 } ] } );
  test.is( _.errIs( err ) );
  test.identical( err.location.filePath, 'at program1' );
  test.identical( err.location.line, 10 );
  test.identical( err.location.col, 5 );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 0 );
  test.identical( _.strCount( errStr, 'Object._errArgsWithMap' ), 2 );

  test.case = 'map in args, with Error';
  var err = _._err( { args : [ { 'location' : { 'filePath' : 'at program1' }, 'line' : 10, 'col' : 5 }, new Error( 'Error' ) ] } );
  test.is( _.errIs( err ) );
  test.notIdentical( err.location.filePath, 'at program1' );
  test.notIdentical( err.location.line, 10 );
  test.notIdentical( err.location.col, 5 );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 4 );
  test.identical( _.strCount( errStr, 'Object._errArgsWithMap' ), 2 );
}

//

function _errEmptyArgs( test )
{
  test.case = 'empty args';
  var err = _._err( { args : [] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'Object._errEmptyArgs' ), 2 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - undefined, level - 2';
  var err = _._err( { args : [], level : 2 } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'Object._errEmptyArgs' ), 0 );

  test.case = 'empty args, throwCallsStack - string';
  var err = _._err( { args : [], throwCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'at program' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - string';
  var err = _._err( { args : [], catchCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at program' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack - empty string';
  var o = { args : [], catchCallsStack : '' };
  var err = _._err( o );
  test.is( _.errIs( err ) );
  test.identical( o.throwCallsStack, o.catchCallsStack );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( err.stack, 'Object._errEmptyArgs' ), 2 );

  /* */

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', stackRemovingBeginIncluding : /program1/ } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginExcluding';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', stackRemovingBeginExcluding : /_errTrowsError/ } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at program1' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding and stackRemovingBeginExcluding';
  var err = _._err
  ({
      args : [],
      throwCallsStack : 'at program1\nat _errTrowsError',
      stackRemovingBeginIncluding : /program1/,
      stackRemovingBeginExcluding : /_errTrowsError/
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  /* */

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and __';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', 'at @2' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, 'at @2' ), 1 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with __';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', '__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with *__';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', '*__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test"';
  var err = _._err( { args : [], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at Err.test.s', '*__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test", stackCondensing - 0';
  var err = _._err
  ({
    args : [],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at Err.test.s', '*__dirname' ],
    stackCondensing : 0
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  console.log( errStr );
  test.identical( _.strCount( errStr, 'UnknownError' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );
  test.identical( _.strCount( errStr, '*__dirname' ), 1 );
}

//

function _errArgsHasError( test )
{
  test.case = 'empty args';
  var err = _._err( { args : [ new Error() ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 4 );
  test.identical( _.strCount( errStr, 'Object._errArgsHasError' ), 2 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - undefined, level - 2';
  var err = _._err( { args : [ new Error() ], level : 2 } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'Object._errArgsHasError' ), 1 );

  test.case = 'empty args, throwCallsStack - string';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'at program' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 3 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - string';
  var err = _._err( { args : [ new Error() ], catchCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 4 );
  test.identical( _.strCount( errStr, 'at program' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack - empty string';
  var o = { args : [ new Error() ], catchCallsStack : '' };
  var err = _._err( o );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 4 );
  test.identical( _.strCount( err.stack, 'Object._errArgsHasError' ), 2 );

  /* */

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', stackRemovingBeginIncluding : /program1/ } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginExcluding';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', stackRemovingBeginExcluding : /_errTrowsError/ } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( errStr, 'at program1' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding and stackRemovingBeginExcluding, fallBackStack';
  var err = _._err
  ({
      args : [ new Error() ],
      throwCallsStack : 'at program1\nat _errTrowsError',
      stackRemovingBeginIncluding : /program1/,
      stackRemovingBeginExcluding : /_errTrowsError/,
      fallBackStack : ''
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  /* */

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and __';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', 'at @2' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, 'at @2' ), 1 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with __';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', '__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with *__';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at asyncCallsStack', '*__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test"';
  var err = _._err( { args : [ new Error() ], throwCallsStack : 'at program1\nat _errTrowsError', asyncCallsStack : [ 'at Err.test.s', '*__dirname' ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test", stackCondensing - 0';
  var err = _._err
  ({
    args : [ new Error() ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at Err.test.s', '*__dirname' ],
    stackCondensing : 0
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  console.log( errStr );
  test.identical( _.strCount( errStr, 'Error' ), 3 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );
  test.identical( _.strCount( errStr, '*__dirname' ), 1 );
}

//

function _errArgsHasRoutine( test )
{
  test.case = 'empty args';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err( { args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ] } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 2 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 2 );
  test.identical( _.strCount( errStr, 'Sample' ), 2 );
  test.identical( _.strCount( errStr, 'next' ), 2 );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( errStr, 'Object._errArgsHasRoutine' ), 2 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - undefined, level - 2';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err( { args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ], level : 2 } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 2 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 2 );
  test.identical( _.strCount( errStr, 'Sample' ), 2 );
  test.identical( _.strCount( errStr, 'next' ), 2 );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( errStr, 'Object._errArgsHasRoutine' ), 1 );

  test.case = 'empty args, throwCallsStack - string';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err( { args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ], throwCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at program' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack - undefined, catchCallsStack - string';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err( { args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ], catchCallsStack : 'at program\nat _errTrowsError' } );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 0 );
  test.identical( _.strCount( errStr, 'at program' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  test.case = 'empty args, throwCallsStack - empty string';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var o = { args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ], catchCallsStack : '' };
  var err = _._err( o );
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 2 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 2 );
  test.identical( _.strCount( errStr, 'Sample' ), 2 );
  test.identical( _.strCount( errStr, 'next' ), 2 );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( err.stack, 'Object._errArgsHasRoutine' ), 2 );

  /* */

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    stackRemovingBeginIncluding : /program1/
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 1 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginExcluding';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    stackRemovingBeginExcluding : /_errTrowsError/
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 0 );
  test.identical( _.strCount( errStr, 'at program1' ), 1 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  test.case = 'empty args, throwCallsStack, stackRemovingBeginIncluding and stackRemovingBeginExcluding, fallBackStack';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
      args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
      throwCallsStack : 'at program1\nat _errTrowsError',
      stackRemovingBeginIncluding : /program1/,
      stackRemovingBeginExcluding : /_errTrowsError/,
      fallBackStack : ''
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 0 );
  test.identical( _.strCount( errStr, 'at program1' ), 0 );
  test.identical( _.strCount( errStr, 'at _errTrowsError' ), 0 );

  /* */

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and __';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at asyncCallsStack', 'at @2' ]
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, 'at @2' ), 1 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with __';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at asyncCallsStack', '__dirname' ]
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - without ".test" and with *__';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at asyncCallsStack', '*__dirname' ]
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at asyncCallsStack' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test"';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at Err.test.s', '*__dirname' ]
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 1 );
  test.identical( _.strCount( errStr, '*__dirname' ), 0 );

  test.case = 'empty args, throwCallsStack, asyncCallsStack - with ".test", stackCondensing - 0';
  var unroll = () => _.unrollMake( [ 'error with unroll', 'routine unroll' ] );
  var err = _._err
  ({
    args : [ unroll,  new Error( 'Sample' ), new Error( 'next' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    asyncCallsStack : [ 'at Err.test.s', '*__dirname' ],
    stackCondensing : 0
  });
  test.is( _.errIs( err ) );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'error with unroll' ), 1 );
  test.identical( _.strCount( errStr, 'routine unroll' ), 1 );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'next' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );
  test.identical( _.strCount( errStr, '*__dirname' ), 1 );
}

//

function _errLocation( test )
{
  test.case = 'args - Error, catchCallsStack and catchLocation';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ) ],
    catchCallsStack : 'at program1\nat _errTrowsError',
    catchLocation : { 'filePath' : 'at @605' }
  });
  test.is( _.errIs( err ) );
  test.identical( _.strCount( err.throwsStack, "at @605" ), 1 );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Sample' ), 2 );
  test.identical( _.strCount( errStr, 'Error' ), 2 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );

  test.case = 'args - Error, throwCallsStack and throwLocation';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ) ],
    throwCallsStack : 'at program1\nat _errTrowsError',
    throwLocation : { 'filePath' : 'at @605' }
  });
  test.is( _.errIs( err ) );
  test.identical( err.location.filePath, 'at @605' );
  test.identical( err.location.col, null );
  test.identical( err.location.line, null );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );

  test.case = 'args - Error, catchCallsStack, catchLocation,throwCallsStack, throwLocation';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ) ],
    catchCallsStack : 'at program1\nat _errTrowsError',
    catchLocation : { 'filePath' : 'at @605' },
    throwCallsStack : 'at program1\nat _errTrowsError',
    throwLocation : { 'filePath' : 'at @605' }
  });
  test.is( _.errIs( err ) );
  test.identical( _.strCount( err.throwsStack, "at @605" ), 1 );
  test.identical( err.location.filePath, 'at @605' );
  test.identical( err.location.col, null );
  test.identical( err.location.line, null );
  var errStr = String( err );
  test.identical( _.strCount( errStr, 'Sample' ), 1 );
  test.identical( _.strCount( errStr, 'Error' ), 1 );
  test.identical( _.strCount( errStr, 'at Err.test.s *' ), 0 );
}

//

function _errOptionBrief( test )
{
  test.case = 'args - Error, without brief option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.brief, srcErr.brief );
  test.identical( err.brief, false );

  test.case = 'args - Error with brief option';
  var srcErr = new Error( 'Sample' );
  srcErr.brief = true;
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.brief, srcErr.brief );
  test.identical( err.brief, true );

  test.case = 'args - Error, with brief option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    brief : 1
  });
  test.is( _.errIs( err ) );
  test.identical( err.brief, srcErr.brief );
  test.identical( err.brief, true );
}

//

function _errOptionIsProcess( test )
{
  test.case = 'args - Error, without isProcess option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.isProcess, srcErr.isProcess );
  test.identical( err.isProcess, false );

  test.case = 'args - Error with isProcess option';
  var srcErr = new Error( 'Sample' );
  srcErr.isProcess = true;
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.isProcess, srcErr.isProcess );
  test.identical( err.isProcess, true );

  test.case = 'args - Error, with isProcess option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    isProcess : 1
  });
  test.is( _.errIs( err ) );
  test.identical( err.isProcess, srcErr.isProcess );
  test.identical( err.isProcess, true );
}

//

function _errOptionDebugging( test )
{
  test.case = 'args - Error, without debugging option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.debugging, srcErr.debugging );
  test.identical( err.debugging, false );

  test.case = 'args - Error with debugging option';
  var srcErr = new Error( 'Sample' );
  srcErr.debugging = true;
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.debugging, srcErr.debugging );
  test.identical( err.debugging, true );

  test.case = 'args - Error, with debugging option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    debugging : 1
  });
  test.is( _.errIs( err ) );
  test.identical( err.debugging, srcErr.debugging );
  test.identical( err.debugging, true );
}

//

function _errOptionReason( test )
{
  test.case = 'args - Error, without reason option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.reason, srcErr.reason );
  test.identical( err.reason, undefined );

  test.case = 'args - Error with reason option';
  var srcErr = new Error( 'Sample' );
  srcErr.reason = true;
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.reason, srcErr.reason );
  test.identical( err.reason, true );
}

//

function _errOptionSections( test )
{
  test.case = 'args - Error, without sections option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.sections, srcErr.sections );
  test.identical( _.mapKeys( err.sections ), [ 'message', 'callsStack', 'throwsStack', 'sourceCode' ] );

  test.case = 'args - Error with sections option, has not head and body';
  var srcErr = new Error( 'Sample' );
  srcErr.section = { 'location' : 'head and body' };
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.sections, srcErr.sections );
  test.identical( _.mapKeys( err.sections ), [ 'message', 'callsStack', 'throwsStack', 'sourceCode' ] );

  test.case = 'args - Error with sections option';
  var srcErr = new Error( 'Sample' );
  srcErr.section = { 'location' : { head : 'location', body : 'at @123' } };
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.sections, srcErr.sections );
  test.identical( _.mapKeys( err.sections ), [ 'location', 'message', 'callsStack', 'throwsStack', 'sourceCode' ] );

  test.case = 'args - Error, sections option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    sections : { 'location' : { head : 'location', body : 'at @123' } }
  });
  test.is( _.errIs( err ) );
  test.identical( err.sections, srcErr.sections );
  test.identical( _.mapKeys( err.sections ), [ 'location', 'message', 'callsStack', 'throwsStack', 'sourceCode' ] );
}

//

function _errOptionId( test )
{
  test.case = 'args - Error, without id option';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.id, srcErr.id );
  test.ge( err.id, 1 );

  test.case = 'args - Error with id option';
  var srcErr = new Error( 'Sample' );
  srcErr.id = 123;
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( err.id, srcErr.id );
  test.identical( err.id, 123 );
}

//

function _errCatchesForm( test )
{
  test.case = 'args - Error, without throws';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.throwsStack ), 1 );
  test.identical( _.strCount( err.throwsStack, 'Err.test.s' ), 1 );

  test.case = 'args - Error, throws';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    throws : [ '@123', '@124' ]
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.throwsStack ), 3 );
  test.identical( _.strCount( err.throwsStack, 'thrown at @123' ), 1 );
  test.identical( _.strCount( err.throwsStack, 'thrown at @124' ), 1 );
  test.identical( _.strCount( err.throwsStack, 'Err.test.s' ), 1 );
}

//

function _errSourceCodeForm( test )
{
  test.case = 'args - Error, without option sourceCode';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strCount( err.sourceCode.code, 'args - Error, without option sourceCode' ), 1 );
  test.identical( _.strCount( err.sourceCode.code, 'var err = _._err' ), 1 );
  test.identical( _.strCount( err.sourceCode.code, 'args : [ srcErr ]' ), 0 );
  test.identical( _.strCount( err.sourceCode.path, 'Err.test.s' ), 1 );

  test.case = 'args - Error, with option sourceCode';
  var srcErr = new Error( 'Sample' );
  var err = _._err
  ({
    args : [ srcErr ],
    usingSourceCode : 0,
  });
  test.is( _.errIs( err ) );
  test.identical( err.sourceCode, null );

  test.case = 'args - Error, with sourceCode';
  var srcErr = new Error( 'Sample' );
  srcErr.sourceCode = 'test.case = "experiment"';
  var err = _._err
  ({
    args : [ srcErr ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strCount( err.sourceCode, 'test.case = "experiment"' ), 1 );
  test.identical( _.strLinesCount( err.sourceCode ), 1 );
}

//

function _errOriginalMessageForm( test )
{
  test.case = 'args - different, simple routine';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, () => 1 ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 3 );
  test.identical( _.strCount( err.originalMessage, 'Sample str' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'undefined' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'null false 1' ), 1 );

  test.case = 'args - different, routine returns routine';
  var abc = function()
  {
    return () => '#1';
  }
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, abc ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 3 );
  test.identical( _.strCount( err.originalMessage, 'Sample str' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'undefined' ), 1 );
  // test.identical( _.strCount( err.originalMessage, "() => '#1'" ), 1 ); // Dmytro : affects in group testing but has no reason for it

  test.case = 'args - different, routine returns map with toStr';
  var a = function()
  {
    return { toStr : () => '#1' }
  }
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, a ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 3 );
  test.identical( _.strCount( err.originalMessage, 'Sample str' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'undefined' ), 1 );
  test.identical( _.strCount( err.originalMessage, '#1' ), 1 );

  test.case = 'args - different, Error with originalMessage';
  var srcErr = new Error( 'Sample' );
  srcErr.originalMessage = 'New error';
  var err = _._err
  ({
    args : [ srcErr, 'str', undefined, '', null, false ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 3 );
  test.identical( _.strCount( err.originalMessage, 'New error str' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'undefined' ), 1 );

  test.case = 'args - different, Error with message';
  var srcErr = new Error( 'Sample' );
  srcErr.message = 'New error';
  var err = _._err
  ({
    args : [ srcErr, 'str', undefined, '', null, false ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 3 );
  test.identical( _.strCount( err.originalMessage, 'New error str' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'undefined' ), 1 );

  test.case = 'args - many spaces and new lines';
  var err = _._err
  ({
    args : [ new Error( '\n\n   Sample     ' ), '\n\nstr   \n', undefined, '', null, false ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 4 );
  test.identical( _.strCount( err.originalMessage, '\n\n   Sample     \n\nstr   \n' ), 0 );
  test.identical( _.strCount( err.originalMessage, 'Sample\nstr' ), 1 );
  test.identical( _.strCount( err.originalMessage, 'str\nundefined' ), 1 );

  test.case = 'Error without description, without fallBackMessage';
  var err = _._err
  ({
    args : [ new Error() ],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 1 );
  test.identical( _.strCount( err.originalMessage, 'Error' ), 1 );

  test.case = 'Unknown error, without fallBackMessage';
  var err = _._err
  ({
    args : [],
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.originalMessage ), 1 );
  test.identical( _.strCount( err.originalMessage, 'UnknownError' ), 1 );
}

//

function _errMessageForm( test )
{
  test.case = 'without option brief';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, () => 1 ],
  });
  test.is( _.errIs( err ) );
  test.gt( _.strLinesCount( err.message ), 10 );
  test.identical( _.strCount( err.message, 'Message of error#' ), 1 );
  test.identical( _.strCount( err.message, 'Beautified calls stack' ), 1 );
  test.identical( _.strCount( err.message, 'Throws stack' ), 1 );
  test.identical( _.strCount( err.message, 'Sample str' ), 1 );
  test.identical( _.strCount( err.message, 'undefined' ), 2 );
  test.identical( _.strCount( err.message, 'null false 1' ), 1 );

  test.case = 'without option brief, option stackCondensing - false';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, () => 1 ],
    stackCondensing : false,
  });
  test.is( _.errIs( err ) );
  test.gt( _.strLinesCount( err.message ), 10 );
  test.identical( _.strCount( err.message, 'Message of error#' ), 1 );
  test.identical( _.strCount( err.message, 'Calls stack' ), 1 );
  test.identical( _.strCount( err.message, 'Throws stack' ), 1 );
  test.identical( _.strCount( err.message, 'Sample str' ), 1 );
  test.identical( _.strCount( err.message, 'undefined' ), 2 );
  test.identical( _.strCount( err.message, 'null false 1' ), 1 );

  test.case = 'with option brief';
  var err = _._err
  ({
    args : [ new Error( 'Sample' ), 'str', undefined, '', null, false, () => 1 ],
    brief : 1
  });
  test.is( _.errIs( err ) );
  test.identical( _.strLinesCount( err.message ), 3 );
  test.identical( _.strCount( err.message, 'Message of error#' ), 0 );
  test.identical( _.strCount( err.message, 'Beautified calls stack' ), 0 );
  test.identical( _.strCount( err.message, 'Throws stack' ), 0 );
  test.identical( _.strCount( err.message, 'Sample str' ), 1 );
  test.identical( _.strCount( err.message, 'undefined' ), 1 );
  test.identical( _.strCount( err.message, 'null false 1' ), 1 );
}

//

function errCatchStackAndMessage( test )
{
  let context = this;
  let visited = [];

  function decrement( i )
  {
    try
    {
      if( i <= 0 )
      throw _.err( 'negative!' );
      return i-1;
    }
    catch( err )
    {
      throw _.err( err, '\nFailed to decrement' );
    }
  }

  function divide( i )
  {
    try
    {
      if( i % 2 === 1 )
      throw _.err( 'odd!' );
      return decrement( i / 2 );
    }
    catch( err )
    {
      throw _.err( err, '\nFailed to divide' );
    }
  }

  try
  {
    divide( 0 );
  }
  catch( err )
  {

    test.description = 'throwsStack';
    let regexp = new RegExp( _.regexpEscape( `${context.nameOfFile}:` ) + '.+', 'g' );
    let throwsStackLocations = _.longOnce( err.throwsStack.match( regexp ) );
    test.is( _.errIs( err ) );
    test.identical( throwsStackLocations.length, 3 );
    test.identical( _.strCount( err.throwsStack, 'thrown at' ), 3 );
    test.identical( _.strCount( err.throwsStack, 'thrown at decrement @' ), 2 );
    test.identical( _.strCount( err.throwsStack, 'thrown at divide @' ), 1 );
    test.identical( _.strCount( err.throwsStack, `${context.nameOfFile}:` ), 3 );

    test.description = 'callsStack';
    test.identical( _.strCount( err.callsStack, 'decrement' ), 1 );
    test.identical( _.strCount( err.callsStack, 'divide' ), 1 );
    test.identical( _.strCount( err.callsStack, `${context.nameOfFile}:` ), 3 );

    visited.push( 'catch1' );
  }

  test.identical( visited, [ 'catch1' ] );
}

//

function errErrorWithoutStack( test )
{
  let context = this;

  function ErrorConstructor()
  {
  }
  ErrorConstructor.prototype = Object.create( _global_.Error.prototype );
  ErrorConstructor.prototype.constructor = ErrorConstructor;
  ErrorConstructor.constructor = ErrorConstructor;

  let err1 = new ErrorConstructor();
  test.identical( err1.stack, undefined );

  let err2 = _.err( err1 );
  test.is( err1 === err2 );

  logger.log( err2.throwCallsStack );

  test.identical( _.strCount( _.strLinesStrip( err2.stack ), _.strLinesStrip( err2.callsStack ) ), 1 );

  test.identical( _.strCount( err2.throwCallsStack, 'Err.test.s:' ), 1 );
  test.identical( _.strCount( err2.throwCallsStack.substring( 0, err2.throwCallsStack.indexOf( 'Err.test.s:' ) ), 'at ' ), 1 );

}

//

function errCustomError( test )
{
  let context = this;

  /* */

  function ErrorConstructor1()
  {
    let result = Error.call( this );
    return result;
  }
  ErrorConstructor1.prototype = Object.create( _global_.Error.prototype );
  ErrorConstructor1.prototype.constructor = ErrorConstructor1;

  let err1 = new ErrorConstructor1();
  test.is( _.strIs( err1.stack ) );
  logger.log( err1 );

  /* */

  class ErrorConstructor2 extends Error{};
  let err2 = new ErrorConstructor2();
  test.is( _.strIs( err2.stack ) );
  logger.log( err2 );

  /* */

}

//

function errorFunctor( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let programPath = a.program( program );

  /* */

  a.appStartNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );

    test.identical( _.strCount( op.output, 'ncaught' ), 0 );
    test.identical( _.strCount( op.output, '= Message' ), 1 );
    test.identical( _.strCount( op.output, 'program.js:9' ), 2 );
    test.identical( _.strCount( op.output, 'program.js:' ), 3 );
    test.identical( _.strCount( op.output, 'arg1 arg2 abc' ), 1 );
    test.identical( _.strCount( op.output.substring( 0, op.output.indexOf( 'program.js:9' ) ), 'at ' ), 1 );

    return null;
  });

  /* */

  return a.ready;

  function program()
  {
    let _ = require( toolsPath );

    let SomeError = _.error_functor( 'SomeError', _onSomeError );

    try
    {
      throw SomeError( 'abc' );
    }
    catch( err )
    {
      logger.log( err );
    }

    function _onSomeError( arg )
    {
      let args = [ 'arg1', 'arg2', arg ];
      return args;
    }

  }

}

//

function uncaughtError( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let programPath = a.program( program );

  /* */

  a.appStartNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- uncaught error -' ), 2 );
    test.identical( _.strCount( op.output, 'Uncaught error' ), 1 );
    test.identical( _.strCount( op.output, '------>' ), 1 );
    test.identical( _.strCount( op.output, '------<' ), 1 );
    test.identical( _.strCount( op.output, '= Process' ), 1 );
    test.identical( _.strCount( op.output, 'Current path :' ), 1 );
    test.identical( _.strCount( op.output, 'Exec path :' ), 1 );
    test.identical( _.strCount( op.output, '= Message of error#' ), 1 );
    test.identical( _.strCount( op.output, '= Beautified calls stack' ), 1 );
    test.identical( _.strCount( op.output, '= Throws stack' ), 1 );
    return null;
  });

  /* */

  return a.ready;

  function program()
  {
    require( toolsPath );
    throw 'Uncaught error'
  }

}

//

function sourceCode( test )
{
  let context = this;
  let visited = [];
  let a = test.assetFor( false );
  let programPath = a.program( program );

  /* */

  a.appStartNonThrowing({ execPath : programPath })
  .then( ( op ) =>
  {
    test.notIdentical( op.exitCode, 0 );
    test.identical( _.strCount( op.output, '- uncaught error -' ), 2 );
    test.identical( _.strCount( op.output, '= Source code from' ), 1 );
    test.identical( _.strCount( op.output, `* 5 :     throw Error( 'Uncaught error' );` ), 1 );
    return null;
  });

  return a.ready;

  function program()
  {
    let _ = require( toolsPath );
    _.include( 'wFiles' );
    throw Error( 'Uncaught error' );
  }

}

//

function assert( test )
{
  var err;

  test.case = 'assert pass condition';
  var got = _.assert( 5 === 5 );
  test.identical( got, true );

  test.case = 'passed failure condition : should generates exception';
  try
  {
    _.assert( 5 != 5 )
  }
  catch ( e )
  {
    err = e;
  }
  test.identical( err instanceof Error, true );

  test.case = 'passed failure condition with passed message : should generates exception with message';
  try
  {
    _.assert( false, 'short error description' )
  }
  catch ( e )
  {
    err = e;
  }
  test.identical( /short error description/.test( err.message ), true );

}

// --
// declare
// --

var Self =
{

  name : 'Tools.base.Err',
  silencing : 1,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    nameOfFile : _.introspector.location().fileName,
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {

    diagnosticStructureGenerate,

    errArgumentObject,
    errFromStringedError, /* qqq : extend the test routine. low priority problem */
    _errTrowsError,
    _errEmptyArgs,
    _errArgsWithMap,
    _errArgsHasError,
    _errArgsHasRoutine,
    _errLocation,
    _errOptionBrief,
    _errOptionIsProcess,
    _errOptionDebugging,
    _errOptionReason,
    _errOptionSections,
    _errOptionId,
    _errCatchesForm,
    _errSourceCodeForm,
    _errOriginalMessageForm,
    _errMessageForm,
    errCatchStackAndMessage,
    errErrorWithoutStack,
    errCustomError,

    errorFunctor,

    uncaughtError,
    sourceCode,
    assert,

  }

}

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
