Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591119;
	b=4BsIB5nknlmZc8Dw6506jUoq4oZRLrkt0/X5eJai3fHeiEJ+7+rRRUKGPA+Bye3+y31r
	 VblDbhVkG44oVpz5h8dPPAszVtHBrU34KnKhctmqv9Cp0NopPaI/3hAs8LQ5V5KzrOIGv
	 P0JKCFZkG/njEu9sJHTTLkVblWsxnxt+7L7/Yj/UWWqOS/uwkCKjIcjJp45PhB8TrmVaE
	 HJ0oDMXDR6jWfPdH8zxn9mcTBRKR4O5a+zAdkJKE1MI9dcjycftzjTuyrmAomUIc4ec0a
	 kyXbvrpaTQSNiWpYfIhxsFkN2Df29RwVwL1mPPjhtqDmuhONpDE2Hv/mPHVYe9V1hsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591119;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mVIXPOOsh4pDi0ngiQnK7XdDiu0u0I6Q3bzVSLpTzrM=;
	b=tiKOxbljuz7JkFMTqc+8RD3n1NH/RuaIf6mMmS8uER4AfQO5q4NbwrJG6a52uZYWBSEH
	 xGHQ8IT3quVRSSPLL/HxXDa1bw5NPj+Sc2s+gb6UstiPW/qUvqDQ8rDWI8Z6C6mtnOng/
	 UR8ddmZZw2DzP3mkc5B/uWZn77jpO53wlvuzz50F04GI8wL/0CNZUeK23xXDfHUkwzG7N
	 RohVSQjjAQmzyL/qCYyBdnzDOPZZG6v/P2qDJtug/Q9B6KQMvCR82kxTtGrXyVnwlZ9pk
	 EaFpwtz44TpQCXmGL2HnTeP8ABekpJ+kBp6X5oPQFTZl8lC9/6ec4IOz879Syv2/d5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TuYJzRQ0;
	arc=none smtp.remote-ip=95.215.58.32
Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748A606A33B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D748A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TuYJzRQ0
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jT7fA8msD1xc6NWh1Y/PLWxhZWGF6LLEUhOnOarRtKE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795591115; v=1; x=1796195915;
 b=TuYJzRQ0UdMOy1p2fyDpUDCsaP1oASFiRPqzjRu6vigZf8OcPZKoaqFwiHij0fPwyqNn4VCZ
 Tu4T9RykWoSiI62eh07LeDgOU/JuHnv9OxQaw3A2jc0KMRPQklq4+k/UyeVSN8F19qvusWEKNHd
 HC0RtVJRBSqpD0j4yjNYEITs=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id aa07813713860ad8;
	Wed, 25 Nov 2026 07:18:35 +0000
X-Mizu-Trace-ID: aa07813713860ad8
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 15:18:26 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, willemb@google.com,
	annaemesenyiri@gmail.com, idosch@nvidia.com
Subject: Re: [PATCH net-next v2 1/3] selftests: net: report SO_RCV test
 failures to the runner
Message-ID: <20261125071826.GC184281@Liu-laptop>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
 <20261125064110.1396439-2-xujingjing@cmss.chinamobile.com>
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
In-Reply-To: <20261125064110.1396439-2-xujingjing@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:41:08AM +0000, Jingjing Xu wrote:
> test_so_rcv.sh uses KSFT_FAIL and KSFT_PASS, but lib.sh defines the
> lowercase ksft_fail and ksft_pass constants. With the uppercase variables
> unset, exit has no argument and returns the successful echo status, even
> when the script has reported failed tests.
> 
> Use the constants actually provided by lib.sh so failures produce a
> nonzero exit status.
> 
> Run as root from tools/testing/selftests/net after building the helpers.
> For the original four-case script, this changes only sender metadata to 1
> while the listeners still expect 2 or 3:
> 
>   sed '/\.\/cmsg_sender/s/\$arg/${arg% *} 1/' test_so_rcv.sh | bash
>   echo $?
> 
> Both versions report four failures. The original prints 0 as the exit
> status; with this fix it prints 1.
> 
> AI-assisted inspection found this while extending the receive tests.
> With deliberately mismatched sender metadata, all four original cases
> fail on both versions: the original script exits 0 and
> the corrected script exits 1. The unmodified sender passes all four cases
> with exit 0. No kernel instrumentation or fault injection was used.
> 
> Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
> Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/test_so_rcv.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
> index d8aa4362879d..ae01fa3c5329 100755
> --- a/tools/testing/selftests/net/test_so_rcv.sh
> +++ b/tools/testing/selftests/net/test_so_rcv.sh
> @@ -66,8 +66,8 @@ done
>  
>  if [ "$FAILED_TESTS" -ne 0 ]; then
>  	echo "FAIL - $FAILED_TESTS/$TOTAL_TESTS tests failed"
> -	exit ${KSFT_FAIL}
> +	exit ${ksft_fail}
>  else
>  	echo "OK - All $TOTAL_TESTS tests passed"
> -	exit ${KSFT_PASS}
> +	exit ${ksft_pass}
>  fi
> base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
> -- 
> 2.53.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
