Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763615;
	b=AAErW/QG0icPF/Y+gpnja39csVMwo9LYvp88vhZCyyW7htBpcGVWW21oAp+kG48RQUET
	 Xbczsav22YEDNUuKKZHdGzI1gcSmo5ebTEEP/CY5a1ANXoTO3G9tEFfmf2CruoKRRuIz2
	 awjJfsiM7jWOW0Y33DrSA+gLMdOjAQPtTeQL6HYpLzomvc6oSLeEWGVNv7Qqn82Qvy+u5
	 jxbG9VZQQmWq7crK47kdbp1rGwvMNoeW4GItMJprtgSDfaxvvHsH1t50aoMj3F7ZNyTxz
	 Yw3tM+k+aGlqHdH4+isieoarQCSWYh2nw2snA1HTV8d3FioLE5W7+W+1JmiVLBTwUyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763615;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=pvabKQGKbnc04kCQ/qraUOI76UVqY+xVrF8MQ3AsusA=;
	b=0FoliG/8R9mbEWt+NRud5GU9YWiwR0APSve1YjLpmFJ6kHIKxnK5KIQYL+VzS6WNVk9t
	 H77LOswc96+NlSS56AQwwUCW1YZA3uAvR2Ffbvwcs2LLltmSPvj2oTYGLNgEvz2WNA/5K
	 ONGr7nexIrhWlAhvsMDr1d+v9Hs6caCXRgi1ZL2ltdVBnO3wXjxjgQoBp5HISoj4V1HmX
	 TLJIHGye3O3TM7sfTYhRGFBaufpJZR9fRgIYOLP0IetIg7GDTxKT3Z1G/dnwT40kdQVCz
	 Rk4mG1ApxOZkaqTI5eqBE5gI/5GrjUXJW6VkHbp9+RCeDXLrk9F85UhgDl4zbkVJWDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CKeEaHts;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C13E606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C13E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CKeEaHts
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=036RiV8enBmhS4v75xx5wVUQREL8ReWDGRhrFiabWj0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795763612; v=1; x=1796368412;
 b=CKeEaHts+I+O1ElWcPa2ftZWZBB3RDCnyDPpMiCN0yBcrkeI/Gb3V2LV1ICJ0RlgM/MaMGmD
 x/JDxT/TxMPB6BGxHz3ag8oP7DMzmsP0BcAeHOumyIsuwNSjR6c7nSARYCai47YFBRAOWZ7nuOD
 WnBO7nnbo9POSByN1qamnWFE=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9cfa7582c4b440f4;
	Fri, 27 Nov 2026 07:13:32 +0000
X-Mizu-Trace-ID: 9cfa7582c4b440f4
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 15:13:26 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Dave Seddon <dave.seddon.ca@gmail.com>
Cc: netdev@vger.kernel.org, Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>,
	Paolo Lungaroni <paolo.lungaroni@uniroma2.it>,
	Frank Dressler <frank@dressler.pro>
Subject: Re: [PATCH iproute2] seg6local: accept lblen and nflen in either
 order
Message-ID: <awktlrfFapC0YURR@fedora>
References: <20261124225227.3795875-1-dave.seddon.ca@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124225227.3795875-1-dave.seddon.ca@gmail.com>

Hi Dave,
On Tue, Nov 24, 2026 at 02:52:27PM -0800, Dave Seddon wrote:
> The man page lists lblen and nflen as flavors attributes in no fixed
> order, but ip only accepts lblen first:
> 
>   ip -6 route add 2001:db8:2::/64 dev lo encap seg6local action End \
>     flavors next-csid nflen 16 lblen 32
>   Error: either "to" is duplicate, or "lblen" is garbage.
> 
> Parse them in a loop.
> 
> Fixes: 04a6b456bf74 ("seg6: add support for flavors in SRv6 End* behaviors")
> Suggested-by: Frank Dressler <frank@dressler.pro>
> Assisted-by: Claude:claude-fable-5-2

There is no need to add Assisted-by tag now.

> Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
> ---
> This applies on top of "seg6local: fix crash when next-csid ends the
> command", as discussed in that thread.

Stephen may handle the order.

Generally, if a patch depends on another patch that hasn’t been applied yet,
we should post them together as a new series.

Thanks
Hangbin
> 
>  ip/iproute_lwtunnel.c | 41 ++++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/ip/iproute_lwtunnel.c b/ip/iproute_lwtunnel.c
> index 53004b5f..3a6bf7c0 100644
> --- a/ip/iproute_lwtunnel.c
> +++ b/ip/iproute_lwtunnel.c
> @@ -1433,27 +1433,30 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
>  		return ret;
>  
>  	if (flavors & (1 << SEG6_LOCAL_FLV_OP_NEXT_CSID)) {
> -		NEXT_ARG_FWD();
> -		if (argc > 0 && strcmp(*argv, "lblen") == 0) {
> -			NEXT_ARG();
> -			if (lbl_ok++)
> -				duparg2("lblen", *argv);
> -			if (get_u8(&lbl, *argv, 0))
> -				invarg("\"locator-block length\" value is invalid\n", *argv);
> -			ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCBLOCK_BITS, lbl);
> -			NEXT_ARG_FWD();
> -		}
> -
> -		if (argc > 0 && strcmp(*argv, "nflen") == 0) {
> -			NEXT_ARG();
> -			if (nfl_ok++)
> -				duparg2("nflen", *argv);
> -			if (get_u8(&nfl, *argv, 0))
> -				invarg("\"locator-node function length\" value is invalid\n", *argv);
> -			ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCNODE_FN_BITS, nfl);
> +		while (NEXT_ARG_OK()) {
>  			NEXT_ARG_FWD();
> +			if (strcmp(*argv, "lblen") == 0) {
> +				NEXT_ARG();
> +				if (lbl_ok++)
> +					duparg2("lblen", *argv);
> +				if (get_u8(&lbl, *argv, 0))
> +					invarg("\"locator-block length\" value is invalid\n",
> +					       *argv);
> +				ret = rta_addattr8(rta, len, SEG6_LOCAL_FLV_LCBLOCK_BITS, lbl);
> +			} else if (strcmp(*argv, "nflen") == 0) {
> +				NEXT_ARG();
> +				if (nfl_ok++)
> +					duparg2("nflen", *argv);
> +				if (get_u8(&nfl, *argv, 0))
> +					invarg("\"locator-node function length\" value is invalid\n",
> +					       *argv);
> +				ret = rta_addattr8(rta, len,
> +						   SEG6_LOCAL_FLV_LCNODE_FN_BITS, nfl);
> +			} else {
> +				PREV_ARG();
> +				break;
> +			}
>  		}
> -		PREV_ARG();
>  	}
>  
>  	rta_nest_end(rta, nest);
> -- 
> 2.56.0
> 
