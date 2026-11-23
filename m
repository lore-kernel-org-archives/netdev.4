Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402757;
	b=iA+/eWHAK7SkD///IArdla6pTplm971Hxfdh7fnhogq63ztboYoGjzb+bGrHvc2NOmPP
	 FFtxeUVm6pKqfCFAluBr35sII3GAffZSehkUB2TRXmbFf9/2CH8QUz89NNMlQcSicNn5u
	 nxR6agTZtUORiMctyX/hrf2tiaCjINCs5VAmiuE6RRw3q3knAUt1hgkyJrAYYRbuMzTBe
	 FyY3GUBD1ILx0gUU0wvIHKDODUF8gSDmutUisx2tXGsT/1hUWBLWG9YfXj5Af+0gSzHHY
	 80OnHDAp/NRqzAyCoVLeePBDuGAF3kmVnWbTkknkFBQDmcdP27Upy/SR/t74+EULkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Qwr2cCAOaet+9t0FDvm07EfNzCXFLHm+HRFJv2U38MA=;
	b=UvIwVF5mjjBfaO1R1j+WYfIFiveZnPf+vh6asPF/GadRScC5PYe3+kNP+2kwqm1IA0fb
	 dHq+sEuSK67YSAwQuQ/bhm/Da0JAcQWvNfRXlp9OliKAoNhxosmb7C+Mbx9oq54nDol8J
	 XxHLmah2RBCUoEYL1QPbgF17/t/VVuFYm/oaXzh0beNDt+n/MCSV2wC1sZyh2LmMOsKs0
	 iV6hhosJxSRwtyP9CmI0ECmkXB0T/s5hP1tXFULdb1YclHRU9rjwGZ6vSrEE76bA3zre4
	 NwIIZVzA16U7byfbPVEv2XnuGN+Agbd4Qb462ZuJ1K5VL9HbB7XIrjgWzReem4/A8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uQKInNfR;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802C606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B802C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uQKInNfR
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y2aqAhugKihjmhMcrLgqcMd8jYX+xFuHeB/bjurEUMk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795402753; v=1; x=1796007553;
 b=uQKInNfRF5slUUo8c7NrFfZSVd4WLR1FUo85S6eFa5obyJ7fb+vhKSiNb4tcCva27J2kaxMy
 IpJ4lD4ZGtc4fOTCqboheQPyudsgNocpHCR8Xed1DC7OvBOUMGLndxbZv/cwLnk3FPxEnvY3HAW
 NF2LCEYSpxfu9xRtVuoPJg8w=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dfd43cbaf89bbd57;
	Mon, 23 Nov 2026 02:59:13 +0000
X-Mizu-Trace-ID: dfd43cbaf89bbd57
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 10:59:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, willemb@google.com,
	annaemesenyiri@gmail.com, idosch@nvidia.com
Subject: Re: [PATCH net-next 1/2] selftests: net: enable receive metadata
 independently of its value
Message-ID: <20261123025906.GC10218@Liu-laptop>
References: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>
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
In-Reply-To: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>

On Sun, Nov 22, 2026 at 03:49:11PM +0000, Jingjing Xu wrote:
> so_rcv_listener passes the expected mark or priority to setsockopt() as
> its SO_RCVMARK or SO_RCVPRIORITY enable flag. Consequently, expecting zero
> also disables the ancillary message being tested. A zero mark or priority
> is valid, but invoking the listener with -M 0 or -P 0 fails with ENOMSG.
> 
> Use a separate nonzero flag to enable reception and keep opt.val solely
> for checking the received value.
> 
> This issue was found with AI-assisted source review and reproduced using
> real UDP sockets. Zero and nonzero mark/priority tests pass over IPv4 and
> IPv6 after the fix; the zero cases fail on the original helper.
> 
> No kernel instrumentation or fault injection was used.
> 
> Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
> Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/so_rcv_listener.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/so_rcv_listener.c b/tools/testing/selftests/net/so_rcv_listener.c
> index bc5841192aa6..3d43fa688338 100644
> --- a/tools/testing/selftests/net/so_rcv_listener.c
> +++ b/tools/testing/selftests/net/so_rcv_listener.c
> @@ -65,6 +65,7 @@ static void parse_args(int argc, char *argv[])
>  
>  int main(int argc, char *argv[])
>  {
> +	int enable = 1;
>  	int err = 0;
>  	int recv_fd = -1;
>  	int ret_value = 0;
> @@ -88,7 +89,7 @@ int main(int argc, char *argv[])
>  		goto cleanup;
>  	}
>  
> -	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname, &opt.val, sizeof(opt.val));
> +	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname, &enable, sizeof(enable));
>  	if (err < 0) {
>  		perror("Recv setsockopt error");
>  		ret_value = -errno;
> base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
> -- 
> 2.53.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
