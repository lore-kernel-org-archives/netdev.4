Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201525;
	b=gwBdwbrp6KMLuk0+n2u40g08JAtdgpq4jQjfcnrDMBHrvYOsmacQJSN/xfNyr6m3A3y8
	 9SXRHkTRnBmWedEIRR53ksVGWw1xbPUA7+bxppXGDmDsP4NVoalOfEcdnr293R8V9HDNX
	 y0IvAxhXlnO26+3RLZ2lMAoqyiHYaeutrnDOBKqXqR0L+PD7okvXNKqG7ZYWW0RAgI15b
	 ziSPn6MuVIYpI89MrVvhSdNh9SHHHZoUVHkhp6lVTp4t3A68Y4Lqo0urVlFrtHZUli/rt
	 AM8H9rmULQ3VsFsLNuADeT+x2YqZ3AUgm1G9pwGGPQNiJkJEGkZ4VtGSGxT7LsBqmng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201525;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OHUdfdJuFdkLiCDSC25vd9dlFBeZzojZJSwQE6bKq78=;
	b=kuN+Ke/yV+2LPts/4oNviaG8giJQ42cdrZAozsfbDohzvCvYgrXyfT3Jzk10Xek+HaGV
	 DVmT186bVPaknCpPkutKz6HeFh55BoK8Rkahj7EmkIpl5w7s/GFSuSYYCXGL/MMoFZp06
	 6/ey9UOXtV6Upr8dFqcgcgjOGr5QC9bX5yKT4pPU89dg1JXxHt/NoRwB6K+V1zGwWFpGp
	 z9i+Dc3ua1pdqp5HMopR58YSHrfNCJjuH6hNlrYIMCUyqXW7SUwGlh5PFuH9wCEVUvZGj
	 yIS53BlwPtXj7dxccuUuAevSboQnQvfMMPRawpI6zyvyVNekZg6rUDwEiyXR4JQyl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YuRs/szp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3AB60A2624;
	Fri, 20 Nov 2026 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YuRs/szp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEB91F000D4;
	Fri, 20 Nov 2026 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795201525;
	bh=OHUdfdJuFdkLiCDSC25vd9dlFBeZzojZJSwQE6bKq78=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YuRs/szpWRCHcRJopChOIyKkJfQmlxZag+6Y3/iZ2CmD2YDXcj5J6fL+dN3tw6bU+
	 WIErB8/LYzwnUOKRWrRcI+lNfNMI1ygKoFM5VZ8h/uIE8W3FgwagMXsWG8LqKKYwhm
	 uPoiBvD2EfX5iopZWhJmw2s+Sp9rI74ZZgfekEC0JgA0ScICDANC7JtGCMHqgNEfiy
	 v1/4Lvevw7P6yMidSbowUlcRMR+X3awHceGp1pfERCpETbJQqaODs0eT2YzMrGvykf
	 v5512IW+jQG3FmDY3ndkj1f2Z/YtC9Lcg7iX3WPaQ0Nl959FJcnc4WQ444zfz8Flt0
	 5jwFC3/4wzz+w==
Subject: Re: [PATCH net] rxrpc: Fix RxGK server to reject an expired ticket
From: netdev-bot+sashiko@kernel.org
To: astellman@stellman-greene.com
Cc: dhowells@redhat.com, marc.dionne@auristor.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 19:05:24 +0000
Message-ID: <179520152436.3135.2656252511958141770@kernel.org>
In-Reply-To: <20261119184541.26343-1-astellman@stellman-greene.com>
References: <20261119184541.26343-1-astellman@stellman-greene.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rxrpc: rxgk_yfs_decode_ticket() misses negative and epoch-
  truncated expiries

--

> diff --git a/net/rxrpc/rxgk_app.c b/net/rxrpc/rxgk_app.c
> --- a/net/rxrpc/rxgk_app.c
> +++ b/net/rxrpc/rxgk_app.c
> @@ -147,6 +147,13 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
>  	if (ret < 0)
>  		goto error_key;
>  
> +	ret = key_validate(key);
> +	if (ret < 0) {
> +		ret = rxrpc_abort_conn(conn, skb, RXGK_EXPIRED, ret,
> +				       rxgk_abort_resp_tok_expired);
> +		goto error_key;
> +	}
> +
>  	token = key->payload.data[0];
>  	token->no_leak_key = true;
>  	*_key = key;
>

[Severity: Medium]
This check only works when the ticket's expirationtime turns into a
positive number of seconds in key->expiry. Two cases get past it.

First, if expirationtime is at least one second before 1970-01-01,
rxrpc_s64_to_time64() returns a negative value. In that case
rxrpc_preparse_xdr_yfs_rxgk() jumps to its expired label, so
key_instantiate_and_link() itself fails with -EKEYEXPIRED. That error
takes the existing "if (ret < 0) goto error_key" just above and never
reaches the new rxrpc_abort_conn() call.

Back in rxgk_extract_token(), the cant_get_token switch only handles
-ENOMEM, -EINVAL and -ENOPKG. -EKEYEXPIRED falls through to
temporary_error, so the RESPONSE is quietly ignored instead of the
connection being aborted with RXGK_EXPIRED. The connection is left
sitting in the challenging state as if the error were transient.

Second, a non-zero endtime within one second of the epoch, in either
direction, is truncated to 0 by rxrpc_s64_to_time64(). The "expiry <
0" test in rxrpc_preparse_xdr_yfs_rxgk() lets that through, so
key->expiry ends up as 0. key_validate() treats 0 as "never expires",
so this expired ticket is accepted.

Both cases need a ticket encrypted with the server key, so they are
edge cases. Still, the point of the patch is to reject expired
tickets.

Would it be better to also map -EKEYEXPIRED from
key_instantiate_and_link() to the RXGK_EXPIRED abort? That could be
done here or in the cant_get_token switch. Separately, a non-zero
endtime that truncates to 0 could be treated as expired in
rxrpc_preparse_xdr_yfs_rxgk(). Alternatively, the ticket's endtime
could be compared directly against the current time here rather than
going through key->expiry. Which approach do you prefer?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119184541.26343-1-astellman%40stellman-greene.com
