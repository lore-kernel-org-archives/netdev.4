Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401895;
	b=MEdDsGLW7d3fwUozIdQ3ml9gheYDiotDIxMpmYUmtu06XfsBp56b8LRDBbC5UzCR/NL+
	 hTfce+uaUxcnk2nUZcoxx5O9dOvE9K+l2jxzVZpr/Jc2cGP/BRIowHiB4Hukz1xVFzyji
	 TOrsvDm7K9q3ZzaOngbOEUIJwnn9vStRWLH4MxuwEFX/fOGr4dmy9BzwezGKhYqP3zhVq
	 SEvIyJPvkloqZL7pI/+79D9rQfnOeJCk2h8Gefe7uxLnQCpkKTM1jJEea+iTeW8PFgiDi
	 wQTpu9uHydx7O8hSV/OF6Q8zYn4iKjzhLkNtkkXis7cFdKdM8Z5w1WB/Rn+0g63N13w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401895;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MZW4Q/pfyt/1f1hQ+5fOgx5YvOxvuRXhncE2MiD1Lsk=;
	b=YGO3PIbLy9bGmEkBcI+YvlEYxaiPKyeztGYU1JEyvjY/PBxUYQF8+HTNKDMaElIhoVX3
	 DJOLivoz2KiMw9HoWEsgoPOKTzukaPP33vclDoymvqYRkrOJumG3IdznrKvn5pT3kWQMi
	 32+7TQPWobtq/YcufP5rCZM+yNBOdwnH1hDx7A6dPZpAXRcppuF8wkXurAQNQOPGlMqjL
	 JGo87/lmazVUBo68+MDhfUzi3V+fcg+qKIHuOo+gPfLkqJxGK0NcK83Hh74lcFsfdMlqj
	 2M+ACKirJUvsyTmOLJENCB/1JDPfe3KBZMl2emH7vOYDap0BreJTunXheVVJcnDGKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JqaV9kwF;
	arc=none smtp.remote-ip=91.218.175.123
Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2B606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JqaV9kwF
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OZOlkKaSXkHl1oyMsAj32/gC3bUeC7HCvUzlH7IGoAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795401892; v=1; x=1796006692;
 b=JqaV9kwFRyJLSzGxNhXTw90kFeJVNkLdW/MmjHGKVyddvp5LGm/75PAHwEV8jNfahIW5K3wB
 cKM9MXWqNK7wNYIesGsqFm73i5KQFBoWzRTd7XQAZSiFxVFDoJ/a4BXzQ5BprLA9iKuPNsFiULP
 AolcpUzIb/CRk/dJa1UaZZA8=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7754e070e3607ff3;
	Mon, 23 Nov 2026 02:44:52 +0000
X-Mizu-Trace-ID: 7754e070e3607ff3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 10:44:43 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, willemb@google.com,
	annaemesenyiri@gmail.com, idosch@nvidia.com
Subject: Re: [PATCH net-next 2/2] selftests: net: cover zero receive mark and
 priority
Message-ID: <20261123024443.GB10218@Liu-laptop>
References: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>
 <20261122154912.1272447-2-xujingjing@cmss.chinamobile.com>
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
In-Reply-To: <20261122154912.1272447-2-xujingjing@cmss.chinamobile.com>

Hi Jingjing,
On Sun, Nov 22, 2026 at 03:49:12PM +0000, Jingjing Xu wrote:
> Exercise SO_RCVMARK and SO_RCVPRIORITY with zero values as well as the
> existing nonzero values, for both IPv4 and IPv6. These cases catch using
> the expected metadata value as the ancillary-message enable flag.
> 
> Use the lowercase ksft_fail and ksft_pass constants defined by lib.sh.
> The uppercase names are undefined, so the failure path otherwise exits
> with the status of echo and incorrectly reports success to the runner.
> 
> With the new tests and the original listener, four of eight cases fail
> and the script exits with status 1. With the fixed listener, all eight
> pass and the script exits with status 0. The original four cases also
> pass with the original listener. Verification used real UDP sockets in
> isolated network namespaces; discovery and testing were AI-assisted.
> 
> No kernel instrumentation or fault injection was used.
> 
> Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
> Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/test_so_rcv.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
> index d8aa4362879d..3263ba2d1a67 100755
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

These are 2 new test cases.

>  check_result() {
> @@ -66,8 +68,8 @@ done
>  
>  if [ "$FAILED_TESTS" -ne 0 ]; then
>  	echo "FAIL - $FAILED_TESTS/$TOTAL_TESTS tests failed"
> -	exit ${KSFT_FAIL}
> +	exit ${ksft_fail}
>  else
>  	echo "OK - All $TOTAL_TESTS tests passed"
> -	exit ${KSFT_PASS}
> +	exit ${ksft_pass}

And this is a stand along fix.

I think you can split this into another patch.

Thanks
Hangbin
