Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618222;
	b=KIxMeYhzYZUHhj2w1LOZkiLoyMPp135NUGz7K+M71XZyC6uYTHSz4jiVFZrZeZUY3IxB
	 zZfqj+e7kGDu8X7omGZAG12tVuGjyZR6+Nf3h0Ft3tHKP35q1suBQMohhpiQ84H/v2pJH
	 Bw6hj8aSCLW1ZxW4k6EFXNd/Aqxn5M+t2ZCJZ41agGUVzoxfPF9l/NpEGMkjw41nICYWJ
	 sH8nlNcM4vxylmziEY+1bQaT6ygOSKR+5TcMmHJuESSN0dBZ/ppT8vqg1qQ4Z9CZsK5Kb
	 x8GehLFDT69BIl5rlcdVr7aWykiwnDy+GY/F1ZusLI+J6ZLwkDYFYKRvvhy4Co+oOXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618222;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mHTWCCbITSp2cFKEOvUTQfCjXBMJ22UtuO2neDfFmQM=;
	b=19eT0Rc/WGMYC47kTqKJk/K+SSjyIEzvE/mxh3E3fVXgfvaRtr2r1mY4U04OJCeEaw+z
	 G0D5UtaCyJP4BmZMsduhlG1LRh5CHTPJPMQS0Df6DLcs83BfbTpqIK5IhyiYt6ZyAusWc
	 Jv3W2S+862hqLQkmIdodXWZtfGDBMbc6SnsvVhG/f+mHkWkPOUON147/ZpnZ1T02WyQ3S
	 hDIe2Lh7QnHEusYpj8gb5U56/VhYtOAlOU/mXbUD564ui7VFkK2/HxWohuO5ikNHaFhtw
	 IF8LgRKGTO7YeCvjihSvpGiplJeG8yUGt3vZ4o0MTbw6IeljfPd53mLUped2Bzs9HmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSeoQDXG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAAD606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSeoQDXG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E211F000D8;
	Wed, 25 Nov 2026 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618221;
	bh=mHTWCCbITSp2cFKEOvUTQfCjXBMJ22UtuO2neDfFmQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dSeoQDXGjwjJyG1/j4RT33N15M4Jq8WX/yXBG8bsdL+a/eeLv3v08+1M2q5oAgTlL
	 3VBbh8GVR2Xjx4yBaA5ThQzUE40f8e+DMtkLUKYIfFLqZfYqnTq1fbN6R9lr1Fngbd
	 TFbfXtLgC5QceMP7w/I1xNEz1FbVE7SQD+hgAFaggQC2k1alLv4QQ4EteTR3CPuauV
	 tjVOeoPm9VZW6np1rdSJFOn5XV1Gjpkks6cBs91ej2ifBXO+0h/ftlLLWpSPJ9MvLW
	 hiwueDZMWVZJT1ueJoB0zIFwV13uPaGMEOJwG3zj/jqG27g9+UL5iPmbgtLYzMfSeJ
	 J/MIUSgXBgV8w==
Date: Wed, 25 Nov 2026 14:50:18 +0000
From: Simon Horman <horms@kernel.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
	linux-afs@infradead.org
Subject: Re: [PATCH] net: rxrpc: Validate RxGK security level before
 allocating context
Message-ID: <20261125145018.GX31322@horms.kernel.org>
References: <20261119030622.1017012-1-linma@zju.edu.cn>
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
In-Reply-To: <20261119030622.1017012-1-linma@zju.edu.cn>

On Thu, Nov 19, 2026 at 11:06:22AM +0800, Lin Ma wrote:
> rxgk_init_connection_security() currently stores a generated transport-key
> context before validating the token security level.  A rejected level can
> therefore leave a context in conn->rxgk.keys[]; a retry overwrites it and
> leaks the context and its crypto transforms.  Validate the level first so
> failed initialization does not allocate or install a context.
> 
> Found by LLM-assisted manual code inspection; not runtime-triggered.
> Related upstream fixes include commit 7e1876caa836
> ("rxrpc: Fix leak of rxgk context in rxgk_verify_response()") and commit
> b555912b9b210 ("rxrpc: Fix key parsing memleak").  These analogous fixes
> support the allocation-lifetime analysis, but neither covers this path.
> 
> Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
> Assisted-by: Codex:GPT-6 <codex@openai.com>
> Signed-off-by: Lin Ma <linma@zju.edu.cn>
> ---
>  net/rxrpc/rxgk.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
> index f9f5a2dc62ed..80fc8bea61a2 100644
> --- a/net/rxrpc/rxgk.c
> +++ b/net/rxrpc/rxgk.c
> @@ -242,6 +242,16 @@ static int rxgk_init_connection_security(struct rxrpc_connection *conn,
>  	conn->security_ix = token->security_index;
>  	conn->security_level = token->rxgk->level;
>  
> +	switch (conn->security_level) {
> +	case RXRPC_SECURITY_PLAIN:
> +	case RXRPC_SECURITY_AUTH:
> +	case RXRPC_SECURITY_ENCRYPT:
> +		break;
> +	default:
> +		ret = -EKEYREJECTED;
> +		goto error;
> +	}
> +
>  	if (rxrpc_conn_is_client(conn)) {
>  		conn->rxgk.start_time = ktime_get();
>  		do_div(conn->rxgk.start_time, 100);

Hi,

I agree this is correct, but if the switch is being moved,
it might be just as well to move it before security_ix and security_level
are set, to avoid any unnecessary work in the error case.

That notwithstanding:

Reviewed-by: Simon Horman <horms@kernel.org>
