package yaml.type;

import yaml.YamlType;
import massive.munit.Assert;

class TSetTest
{
	@Test
    public function shouldOnlyAllowNullValuesInMaps()
	{
		var type = new TSet();
		var map = new StringMap();
		map.set("key", "value");
		
		try {
			type.resolve(map);
			Assert.fail("Expcted failure due to map having non-null value");
		}
		catch(e:ResolveTypeException) {
			
		}
	}

	@Test
	public function shouldAllowMapsWithNullValue()
	{
		var type = new TSet();
		var map = new StringMap();
		map.set("key", null);
		
		Assert.areEqual(map, type.resolve(map));

	}
}
