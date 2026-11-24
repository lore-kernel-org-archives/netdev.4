Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.146.106.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507022;
	b=ClCxNjMA3GcgO9COjIdGEHLmSdgh/Hg+ZCFClSFDHpNCbjwMLwMSMA8oU+RJqfjKp7E8
	 w0GgWX5K02BI9caNQPtjcmBvwVbIM0nQm4AO7/iOChDcCy5zkZQ9ow6qoOpFRAlIEWtC6
	 /Kkuq2y8mFqnlSW6teSi+yzuihohTkqV8b+I0G9LL+GEcvG/36MKWB1QoAHWBSFQoiu+H
	 uhmTngGHZYTQxwY9Uk3ghgEcmKO19aQ1S1cHaZDzSPHZiJAA+MkRbL/getxkNFMi4xqG/
	 9BHv3GT7uZlTaiVLLVC7Z8CUcCL52xN6a0XSoSqEQIJtlXPDf7aXqdHB3aXyxtNaArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507022;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v8qY578zeHnJhveG6usYiBXRuMFtPQLfHFwkDhYx4U4=;
	b=NBKb+Uu2odOYHo3ELgsUrfeeS8pNfo3OAVRU2/DHNaQuC+8hJk+QWZAr1adF/cl7wY/Y
	 k1Tp8KbJxcIo1Hy/68QYF36aEcmNvlVWGAB5Uof2Az9TPRCsd3dEheKUnYgAa8RuRYphu
	 OQOi6SkG+OwHIor58472smBaVn3PyVnjbyNiJ58HArPPo1yYGxl6U+9UYWPd9/McRsbkg
	 +GIU1HqgVXLTMA6+K76emEwCJjhsh87aTU4pIfN4UFMs3ADRmQNe/YJZG42j639fzzw6O
	 ra6sCzY8u+vE5haonJRXLwhiodH0gQN9JZPXrOXInua3tsnL3prj3Qp76o1hVT7UNGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dressler.pro;
	spf=pass smtp.mailfrom=dressler.pro;
	dkim=pass header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b="cKLw/W0z";
	arc=none smtp.remote-ip=62.146.106.18
Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE61606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dressler.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dressler.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=cKLw/W0z
Received: from [192.168.0.40] (unknown [37.228.226.218])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 71055E0BCF;
	Tue, 24 Nov 2026 08:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dressler.pro;
	s=uddkim-202310; t=1795507014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8qY578zeHnJhveG6usYiBXRuMFtPQLfHFwkDhYx4U4=;
	b=cKLw/W0zcVljvMbpPchpl57ScKROc3/RCtjn1lHaIVyyMqslRbEpNSaDhXRtoOCPwxzjnv
	mjZ7x2fKukcOr0pzreKrAp9PjetifYlEhaYuaWi/xJGdx77jqMADmzOpJm7Bop2Y4wxBMK
	J4/5bYpe3VrAnSZC0sCFFoCukn3PRCNkdCBPmhvdU7khdh8rJ5Lyti+XGV96Lcn+ZILoEm
	bUylhcWu4BUOcF+of6Ac9o91rS7RsIrcEIxTzOzBOoCPnZarJEG2UOgKe7MMSAOVMK7jZG
	RA1Pq+a13t3oAofIRT38VBMnN93mJ3mgLbdklsqjfnmcij6jNZgdILmYa9Dmew==
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=dressler-pro-0001 smtp.mailfrom=frank@dressler.pro
Message-ID: <a5b77684-1041-49ed-8fd6-567e6896476d@dressler.pro>
Date: Tue, 24 Nov 2026 07:56:52 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iproute2] seg6local: fix crash when next-csid ends the
 command
To: Dave Seddon <dave.seddon.ca@gmail.com>, netdev@vger.kernel.org
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 David Ahern <dsahern@kernel.org>,
 Paolo Lungaroni <paolo.lungaroni@uniroma2.it>
References: <20261124055551.3390282-1-dave.seddon.ca@gmail.com>
Content-Language: en-US
From: Frank Dressler <frank@dressler.pro>
In-Reply-To: <20261124055551.3390282-1-dave.seddon.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> ip crashes when "flavors next-csid" ends the command, with or without
> "lblen N":
> 
>    ip -6 route add 2001:db8:2::/64 dev lo encap seg6local action End \
>      flavors next-csid
> 
> seg6local_parse_flavors() steps past the last argument and passes the
> NULL terminator to strcmp(). Check argc first.
> 
> Fixes: 04a6b456bf74 ("seg6: add support for flavors in SRv6 End* behaviors")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
> ---
>   ip/iproute_lwtunnel.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ip/iproute_lwtunnel.c b/ip/iproute_lwtunnel.c
> index 9a1e747c..53004b5f 100644
> --- a/ip/iproute_lwtunnel.c
> +++ b/ip/iproute_lwtunnel.c
> @@ -1434,7 +1434,7 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
>   
>   	if (flavors & (1 << SEG6_LOCAL_FLV_OP_NEXT_CSID)) {
>   		NEXT_ARG_FWD();
> -		if (strcmp(*argv, "lblen") == 0){
> +		if (argc > 0 && strcmp(*argv, "lblen") == 0) {
>   			NEXT_ARG();
>   			if (lbl_ok++)
>   				duparg2("lblen", *argv);
> @@ -1444,7 +1444,7 @@ static int seg6local_parse_flavors(struct rtattr *rta, size_t len,
>   			NEXT_ARG_FWD();
>   		}
>   
> -		if (strcmp(*argv, "nflen") == 0){
> +		if (argc > 0 && strcmp(*argv, "nflen") == 0) {
>   			NEXT_ARG();
>   			if (nfl_ok++)
>   				duparg2("nflen", *argv);

Good find, and your change fixes the segfault.

But I think the way you fix it is a bit uncommon in the code base that 
seems to instead prefer a pattern like

   while (NEXT_ARG_OK()) {
     NEXT_ARG_FWD();
     if (strcmp(...) == 0) {
       ...
     } else if (strcmp(...) == 0) {
       ...
     } else {
       PREV_ARG();
       break;
     }
   }

for parsing a list of optional arguments in any order.

With that style, you would also fix another bug which is that it 
currently expects lblen and nflen in that specific order which 
contradicts the man page that allows them in any order.

The presence of the if (lbl_ok++) and if (nfl_ok++) also seem to 
indicate that the code was originally intended to run in a loop.
