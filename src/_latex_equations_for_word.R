y_{i} \sim \mathsf{Beta} \bigl(\mu_{i}, \phi \bigr) 
\eqarray{logit(\mu_{i}) &= @ &\, \beta_0 @ & + \sum_{j=1}^{J=5} \beta_{1[j]} x_{1[j]} + \sum_{k=1}^{K=4} \beta_{2[k]} x_{2[k]} + \sum_{f=1}^{F=3} \beta_{3[f]} x_{3[f]} + \sum_{s=1}^{S=5} \beta_{4[s]} x_{4[s]}  @ & + \sum_{j,k} \beta_{1\times2[j,k]} x_{1\times2[j,k]} + \sum_{j,f} \beta_{1\times3[j,f]} x_{1\times3[j,f]} + \sum_{k,f} \beta_{2\times3[k,f]} x_{2\times3[k,f]} @ & + \sum_{j,k,f} \beta_{1\times2\times3[j,k,f]} x_{1\times2\times3[j,k,f]} @ &\,}
\beta_{0}  \sim \mathsf{Normal}(0,1)  
\beta_{1[j]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1}})  
\beta_{2[k]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{2}})  
\beta_{3[f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{3}})  
\beta_{4[s]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{4}})  
\beta_{1\times2[j,k]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1\times2}})  
\beta_{1\times3[j,f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1\times3}})  
\beta_{2\times3[k,f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{2\times3}})  
\sigma_{\beta_{1}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{2}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{3}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{4}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{1\times2}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{1\times3}} \sim \mathsf{Student T}(3,0,2.5)  
\sigma_{\beta_{2\times3}} \sim \mathsf{Student T}(3,0,2.5)  
\phi \sim \mathsf{Gamma}(0.1,0.1)  
\,

#############################################################
#############################################################

y_{i} \sim \mathsf{Normal} \bigl(\mu_{i}, \sigma_{y} \bigr) 
\eqarray{\mu_{i} &= @ &\, \beta_0 @ & + \sum_{j=1}^{J=5} \beta_{1[j]} x_{1[j]} + \sum_{k=1}^{K=4} \beta_{2[k]} x_{2[k]} + \sum_{f=1}^{F=3} \beta_{3[f]} x_{3[f]} + \sum_{s=1}^{S=5} \beta_{4[s]} x_{4[s]}  @ & + \sum_{j,k} \beta_{1\times2[j,k]} x_{1\times2[j,k]} + \sum_{j,f} \beta_{1\times3[j,f]} x_{1\times3[j,f]} + \sum_{k,f} \beta_{2\times3[k,f]} x_{2\times3[k,f]} @ & + \sum_{j,k,f} \beta_{1\times2\times3[j,k,f]} x_{1\times2\times3[j,k,f]} @ &\,}
\beta_{0}  \sim \mathsf{Normal}(\bar{y},y_{SD} \times 5)  
\beta_{1[j]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1}})  
\beta_{2[k]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{2}})  
\beta_{3[f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{3}})  
\beta_{4[s]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{4}})  
\beta_{1\times2[j,k]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1\times2}})  
\beta_{1\times3[j,f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{1\times3}})  
\beta_{2\times3[k,f]}  \sim \mathsf{Normal}(0,\sigma_{\beta_{2\times3}})  
\sigma_{\beta_{1}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{2}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{3}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{4}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{1\times2}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{1\times3}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{\beta_{2\times3}} \sim \mathsf{Gamma}(shape,rate)  
\sigma_{y} \sim \mathsf{Cauchy}(0,y_{SD}) 
\,