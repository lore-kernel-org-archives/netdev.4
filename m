Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763127;
	b=JTRv9nMqbL/BXazGgEgT6qnShChXanWQuUKIM21npAeT0ifCiKlGaJvr75AlZVuzIM9y
	 EQ6SLH4PNwTC0Dm3DV0c02NJvhKOyVuhSUM0bUfYzDy0JO5CgF1rxAIGoomBsyLCqMcul
	 FRzAtaj1loJlN4o+ASLlw+vQkMwCIuomdMEzCf4JI57JnkUGyRXSXlHMWXD24DPbtJZAv
	 9xGJAFoH6+f2TkSSM9wdJnuGfLNgKIv3JILHU5tPIDHyeBH7ReKC1nmwS9IpFcXj+MhuB
	 b7Gx73TDdsQjcvzKetj+s7vtQQiHpa+x5xy87fIcabTN9OWCI9LP/0lI2fh7lOLaIQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763127;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fFOwbPhYtG2VA+fvtjG+N9SEnNkXpuXFk3FuyEsjnUY=;
	b=narmtruu+kRZgqQQa/B4Srwm5U/5SlBoY4Q3RrNeOD3ihZjKUN287PWTbdKT0HJKEprH
	 0Sqm4p2VALTC67ZNF24L12+2Rg4tNopRhdKG6Hk9GbQSpS+rdjHgfpDZk7t38ChvWhce8
	 5gIcZ2r+IlzJhkNrcwUPJQlG8rRgs1XoaOq1pRJE7Cnix26JaaIPFZRoMMH4ZZ+Kb7/es
	 xpY7k467TtDXHopo5twEu1cfFlNGthFRVnybmqun4SAjYkGdaClZrw35ABpSx3EVO1gWv
	 NUiZT0wjw+WXJxQiH4GjaOTYGIWLjGBC5dhDMJgMUcS5+nuEYhEnL/MeJ0s3dOg5i7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dGEuhynH;
	arc=none smtp.remote-ip=95.215.58.56
Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BFD606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dGEuhynH
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=odMuhZyhTxb63ua+fYRErxMQX4wCePsPK5HbcEK85TY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795763124; v=1; x=1796367924;
 b=dGEuhynHzpnjRcWSmhXa2B9DjkK63AGOK7QAk5a+M8KPsAfI1wUCr8iPYZGy9jTjWuKN04ns
 d6+Etnvt87OKdVBfmH3/yawcVAFgDbF0vXj9+Ml0xHqH75G9CpqYAzOjlkR3AnNVQijfvAESnfU
 s/9/3o1QWbgeoRV+9sEWMVt4=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c4d1fd8a6993fb10;
	Fri, 27 Nov 2026 07:05:24 +0000
X-Mizu-Trace-ID: c4d1fd8a6993fb10
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 15:05:16 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org
Subject: Re: [PATCH iproute2] names: terminate the name returned by
 id_to_name()
Message-ID: <awkrrM2Tu0tveZMv@fedora>
References: <20261125164721.1942828-1-stephen@networkplumber.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125164721.1942828-1-stephen@networkplumber.org>

On Wed, Nov 25, 2026 at 08:47:21AM -0800, Stephen Hemminger wrote:
> strncpy() does not terminate when the source is as long as the limit,
> and the tc class name from tc_cls may be up to NAME_MAX_LEN while the
> caller's buffer is IDNAME_MAX. A name of 256 characters or more filled
> the buffer with no room for the NUL, so the snprintf() that formats it
> read past the end.
> 
> Use strlcpy(), which always terminates.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> ---
>  lib/names.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/names.c b/lib/names.c
> index 4ecae92b..697942d2 100644
> --- a/lib/names.c
> +++ b/lib/names.c
> @@ -142,7 +142,7 @@ char *id_to_name(struct db_names *db, int id, char *name)
>  		entry = entry->next;
>  
>  	if (entry) {
> -		strncpy(name, entry->name, IDNAME_MAX);
> +		strlcpy(name, entry->name, IDNAME_MAX);
>  		return name;
>  	}
>  
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
