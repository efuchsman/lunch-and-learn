require 'rails_helper'

RSpec.describe Recipe do
  it "exists and has attributes" do

    data = {
      recipe: {
        label: "Passport to Japan: Edamame, Gyoza, Rice and Teriyaki Beef",
        image: "https://edamam-product-images.s3.amazonaws.com/web-img/237/2374bd7d348b32ba325739f8d9169119.jpeg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCCkReBSmJCk7oD30Vnz6HxywT2iRG6mhN696J134kzRAIhALDiPBa%2FL5CjoUQOA7Z9445vJ09LSnVsTK4NSyMXw5W2KtUECOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgyFMY1doBGnkTty5hMqqQTfba045X9SCGwfrehyDPpZHMVw11hozmk1gH6Vo6qTQh%2BQAx7yOvtRQUQL2Sk1CBwnt7D%2BPTi0MrLXWQNyRtNtfRE%2BGP39JF5cIcGhSCzzoiqysERrLkIgknZGND0Qad7P%2BVUV%2FueZB%2BQGCbeZIPw9v2lOOGHQOVYSb5ME1Nofaohxgwnt7dw4dIjyRJz%2F5EOHyh4Neg81cVhN9U6CC0ZgSV2phY44ML4P50iOW7ToS2natMNH2UCuHzp5I%2BTk4f5rhMqurehJWaCnu%2BV2fC0VZyLS%2Fl8qZkibGhOIHhW0w5R670WTSwZadfz%2B0z1fEpml9qvvjzTnT%2BqwaNCYonLmCRPz6ule5PmTeSrahLMNHJmfPHxhfX0Bl%2BOhqoHCpdPM64QiJwxQrW3jKul%2B1dfDAPopGLnVQrKFgyd61jPCOBz3m32icoUee4yxYrA%2BgcFG3rP3lbSTAo7WoGBvVmJkir2Ixs8jaftbekPNWrDu9y9Jpphwa7dxG1KcRmsUARhbQcTnzxgpq2Jfsw1spiJFhkF4XD00lUZ%2BKc6qPVIVsh5vcm%2BGbcmmJ73Lmk%2FxBxSvxlrFN%2BZlqAeXzvnEhiCWCeh1wAo%2B3rwwrGVkKOiIElQL2HAjvANWDzs0f26JBNs41vZOo4rc6tQgiDal9vRM7yaoDo87arw2a0fLa1%2FaY59%2Bre%2FMF5wvX%2FiKyaAcTfA9leLU%2BBNTugcDZM8agh%2B0c6ayzBg1yn1LMLu7iJ4GOqgB2HJXREGVfd0BRLMemNP%2FNndYvUMTf%2B54jdgCh6VpkpK8oibTC9XGYQpYnUvojN%2B10F9WeAwO%2B9P26OH%2FrQojcGebalxh%2BqUlDPo5EPVFxZl9Vax4Ffrgyuh%2FGMRR7jNB1luFCk2cIpFhFJ%2FWJfgWtTsRHqbk%2B31TRbCGPo9rbgR7Xtpx36N3jst0L0x6WHKapdnB2dZHgcppGx2HsIfJBRaaMSGZI5gb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230114T034142Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJACUNVUM%2F20230114%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2b03695c76600f44f043995c25e207754910f3357660edc93c8d7819b6351c04"
      },
      url: "https://www.foodnetwork.com/recipes/rachael-ray/passport-to-japan-edamame-gyoza-rice-and-teriyaki-beef-recipe-2013871"
    }

    recipe = Recipe.new(data)

    expect(recipe).to be_an_instance_of(Recipe)
    expect(recipe.title).to eq("Passport to Japan: Edamame, Gyoza, Rice and Teriyaki Beef")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/237/2374bd7d348b32ba325739f8d9169119.jpeg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQCCkReBSmJCk7oD30Vnz6HxywT2iRG6mhN696J134kzRAIhALDiPBa%2FL5CjoUQOA7Z9445vJ09LSnVsTK4NSyMXw5W2KtUECOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgyFMY1doBGnkTty5hMqqQTfba045X9SCGwfrehyDPpZHMVw11hozmk1gH6Vo6qTQh%2BQAx7yOvtRQUQL2Sk1CBwnt7D%2BPTi0MrLXWQNyRtNtfRE%2BGP39JF5cIcGhSCzzoiqysERrLkIgknZGND0Qad7P%2BVUV%2FueZB%2BQGCbeZIPw9v2lOOGHQOVYSb5ME1Nofaohxgwnt7dw4dIjyRJz%2F5EOHyh4Neg81cVhN9U6CC0ZgSV2phY44ML4P50iOW7ToS2natMNH2UCuHzp5I%2BTk4f5rhMqurehJWaCnu%2BV2fC0VZyLS%2Fl8qZkibGhOIHhW0w5R670WTSwZadfz%2B0z1fEpml9qvvjzTnT%2BqwaNCYonLmCRPz6ule5PmTeSrahLMNHJmfPHxhfX0Bl%2BOhqoHCpdPM64QiJwxQrW3jKul%2B1dfDAPopGLnVQrKFgyd61jPCOBz3m32icoUee4yxYrA%2BgcFG3rP3lbSTAo7WoGBvVmJkir2Ixs8jaftbekPNWrDu9y9Jpphwa7dxG1KcRmsUARhbQcTnzxgpq2Jfsw1spiJFhkF4XD00lUZ%2BKc6qPVIVsh5vcm%2BGbcmmJ73Lmk%2FxBxSvxlrFN%2BZlqAeXzvnEhiCWCeh1wAo%2B3rwwrGVkKOiIElQL2HAjvANWDzs0f26JBNs41vZOo4rc6tQgiDal9vRM7yaoDo87arw2a0fLa1%2FaY59%2Bre%2FMF5wvX%2FiKyaAcTfA9leLU%2BBNTugcDZM8agh%2B0c6ayzBg1yn1LMLu7iJ4GOqgB2HJXREGVfd0BRLMemNP%2FNndYvUMTf%2B54jdgCh6VpkpK8oibTC9XGYQpYnUvojN%2B10F9WeAwO%2B9P26OH%2FrQojcGebalxh%2BqUlDPo5EPVFxZl9Vax4Ffrgyuh%2FGMRR7jNB1luFCk2cIpFhFJ%2FWJfgWtTsRHqbk%2B31TRbCGPo9rbgR7Xtpx36N3jst0L0x6WHKapdnB2dZHgcppGx2HsIfJBRaaMSGZI5gb&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230114T034142Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJACUNVUM%2F20230114%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2b03695c76600f44f043995c25e207754910f3357660edc93c8d7819b6351c04")
    expect(recipe.url).to eq("https://www.foodnetwork.com/recipes/rachael-ray/passport-to-japan-edamame-gyoza-rice-and-teriyaki-beef-recipe-2013871")

  end
end
