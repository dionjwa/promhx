
package promhx;
import haxe.unit.TestCase;
import promhx.Promise;

class TestPromhx extends TestCase {

    public function testSimpleThen(){
        var p1 = new Promise<Int>();
        var expected = 1;
        p1.then(function(x) assertEquals(x,expected));
        p1.resolve(expected);
    }

    public function testSimpleWhen(){
        var p1 = new Promise<Int>();
        var p2 = new Promise<Int>();
        var expected1 = 4;
        var expected2 = 5;
        Promise.when(p1,p2).then(function(x,y){
            assertEquals(x + y, expected1 + expected2);
        });
        p1.resolve(expected1);
        p2.resolve(expected2);
    }
}
