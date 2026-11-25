Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595783;
	b=Lf0I4EAWf29ihEiu7djx+ro1kvQD8KEl9B4BXt5o19zO+Sk6F1D2bn7QeZRWKp3YlvsY
	 9qJRfGZfPqlhMmGEB6UvbYs4+cTM5EkWbVamy+EnVz8gchICbx+w27Rh3lbh/XHuIUiIh
	 5b8mBUMIlzrDlpX649+P9xcrd0/7IRtgBYuuZLRg0qk5JxPHH6JUSHrwPcyu60P5/q/YA
	 12EwbSrlJN8aJJLB8TZivf6+AtOHSwyt8y3ArKuKqdSsHF7CGx+7T3E/QwDEP4CJ6Tfnl
	 u9ySYDzQCi+RXPb92CNX2wCUXV56uxC2j3ACLBf6XBInpnsbh/FZN56EfZq6ck2CBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595783;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XN1gQ3fRYIMVA+6ax3yiapPYj8MwIH2f0iCjt0MzEgI=;
	b=Vj5CIGXUlPz71gIGTUR4iqq+auChkFCnC9LCEmw7kYH1UKQN2gBKR9rpFjWB+aX1qN/i
	 0FYp6PkDyxZLXcVKVulxxHzra0f3k9yJRZFkBZ5gKPG8yQ1XMgJ7RM8xc3+Fdp7BJMcJF
	 wg5ZdNizlN9nzUxdGaLh7juK9cc/5VJ0VkD31knDvODScOd1t5JCtAguKRRNGvyrG7aZe
	 BMiSGqYBHyrirGukLyKXqYbTZDIraSIufvYJhcKJLWCTuEhLroQKAhZbCLWNFzFDSev5y
	 sUQ5v2np1aG7oUxrm1efXvwqa1c8F8xvX6hgKbYWiGm2xBEhdKL9nep2HE2VjFGOWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uUB6M9Sq;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80525606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80525606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uUB6M9Sq
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0K/8LEcVyCEO3ne/hj4xdKmWz5s3ulj/xr0pxKVqumo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795595780; v=1; x=1796200580;
 b=uUB6M9SqsBLfhlz6JpDefD2OwXuH6CtXMAi+jJNqxKTPWsm00OKAJKd14yIxa5K3V8RFll3J
 jIBUgmPZg/zjlLQlm595HlZnyMV2dP/Wc1UkVGegk14AtoFc7IT4DqRh+QNpk833+9fxV3YlWV7
 bVDfsCMV98cg7qCwCNMRttIU=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1a54a8f12ba78d2c;
	Wed, 25 Nov 2026 08:36:20 +0000
X-Mizu-Trace-ID: 1a54a8f12ba78d2c
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 16:36:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, willemb@google.com,
	annaemesenyiri@gmail.com, idosch@nvidia.com
Subject: Re: [PATCH net-next v2 3/3] selftests: net: cover zero receive mark
 and priority
Message-ID: <20261125083610.GD184281@Liu-laptop>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
 <20261125064110.1396439-4-xujingjing@cmss.chinamobile.com>
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
In-Reply-To: <20261125064110.1396439-4-xujingjing@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:41:10AM +0000, Jingjing Xu wrote:
> Exercise SO_RCVMARK and SO_RCVPRIORITY with zero values as well as the
> existing nonzero values, for both IPv4 and IPv6. These cases catch using
> the expected metadata value as the ancillary-message enable flag.
> 
> With the new tests and the original listener, four of eight cases fail
> and the corrected script exits with status 1. With the fixed listener,
> all eight pass and the script exits with status 0. The original four
> cases also pass with the original listener. Verification used real UDP
> sockets in isolated network namespaces; discovery and testing were
> AI-assisted. No kernel instrumentation or fault injection was used.
> 
> Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/test_so_rcv.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
> index ae01fa3c5329..3263ba2d1a67 100755
> --- a/tools/testing/selftests/net/test_so_rcv.sh
> +++ b/tools/testing/selftests/net/test_so_rcv.sh
> @@ -11,6 +11,8 @@ FAILED_TESTS=0
>  declare -A TESTS=(
>  	["SO_RCVPRIORITY"]="-P 2"
>  	["SO_RCVMARK"]="-M 3"
> +	["SO_RCVPRIORITY_ZERO"]="-P 0"
> +	["SO_RCVMARK_ZERO"]="-M 0"
>  )
>  
>  check_result() {
> base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
> -- 
> 2.53.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
