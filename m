Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042703;
	b=HAhyGCHOtoo1DLeoySUbXbgG7QeJ68Ct7jLn2M9DHBOMhEAEWgkFyDWnov9bWI+KU3g1
	 IlsnFS2LVQ6MM4NBN9TGlXCdYMiGLhQv1d8GL4hDPSuoXhJqzzsslinnpX99YwdG1noe0
	 0octHDldof/gZkmWrA9gQ3OznKbwbA+J2aBkJtwjqtnXdB/lq7aogFkuKACgKgWpS2GPp
	 rv36/qKtPZAfMm4jJ41KM/AAvPwelk57IKibEvmZ2m90Cio8IqUIcJhl9kdpGPEawLwF8
	 f9CfLhM2pskndbTkI1mWBnkpg/I5zomaUn1f4cUiy59rlVNPJfByLzeqi4cu63tDfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042703;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mhhQ9Ioq+2qUazDNyhj0906QRa7/QEquZU1rpFFbyfw=;
	b=R2zEmGB49CglJpBG9u7rq1HcuQ0Es/EGPuyzjSozreU7R6zrg8GGYxQ2WcMBtfjy2kcE
	 POG9c3R3J3H78XPzgN4dVO5YCTaQhKT+/OePCpuPdvyfE4WAGXQdnHsuhGb36xccPEq40
	 sWjbqU4ry8Ci136IwCIp4BW5tvE0juLxmmruwwoW+wEEdFsGzGjfmxExSYDeFFoHbp4ji
	 +ntDbNFGFppAb1AIjeXVfZweF4/uF5e8NmFCOpOYJ92FvIPaFWXn4zJ70LJeNEdphqo2d
	 LpK3/vbKPkmQE+9lSOew3Ye1Zq7Hgez93jstxuQ3vIms4rmnx3x+IOwQdcBPGSh61zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/X+Qtf4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1869606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/X+Qtf4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B46E1F000C7;
	Wed, 18 Nov 2026 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042703;
	bh=mhhQ9Ioq+2qUazDNyhj0906QRa7/QEquZU1rpFFbyfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V/X+Qtf4hIKu5jHJX1+PxB2nEt41q8+4c/jpTdEEoFc2BI1O5PD7sdC2mW4akLaCi
	 nZusPH2dXcNLmJ3GalAKMf4fKXEz7UE9HQ+Lmb1zAKCEwsKMa7CG65R04OXI3oBQrS
	 uHOURWSFvgbDWGuHhY4tJmNHZXXV3x9EBIjdUw/u2wm35fdOdbMrdJ16dIvyvSqMc4
	 WVX47lwXYsX2wYXoBKzZsfqoL5sJJQUckzn2CIRtfML//rzy/JSCUeJjU2SQJQpNIv
	 a9XyRx2RuP5s/9LvxddJDO0SL2kjJucifzdhdSKpfEHAN3cesm9w7IU1OXibF7NEhb
	 YFZ+wWae9wvxg==
Message-ID: <99ccfd3c-47d6-41bd-a8d4-5036f0edafea@kernel.org>
Date: Wed, 18 Nov 2026 15:58:22 -0700
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
Subject: Re: [PATCH iproute2-next 1/2] mnl_utils: add a dump helper for
 NLM_F_DUMP_INTR
Content-Language: en-US
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 Ivan Vecera <ivecera@redhat.com>, Jiri Pirko <jiri@resnulli.us>
References: <20261110110101.2155953-1-poros@redhat.com>
 <20261110110101.2155953-2-poros@redhat.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261110110101.2155953-2-poros@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 5:01 AM, Petr Oros wrote:
> The kernel sets NLM_F_DUMP_INTR on a dump message when the dumped
> objects changed between two parts of the dump, so the result can miss an
> object or list it twice. mnl_cb_run2() answers the flag with EINTR on
> the first such message. mnlu_gen_socket_sndrcv() then prints "kernel
> answers: Interrupted system call" and returns with the rest of the dump
> still queued in the socket. The caller has passed a part of the objects
> to its callback by then and cannot tell an interrupted dump from a
> request that failed.
> 
> Add mnlu_gen_socket_sndrcv_dump(). It clears the flag in every received
> message before the callbacks run, reads the dump to its end and tells
> the caller through a bool that the dump was interrupted. The caller can
> then repeat the request on the same socket or warn the user, as
> rtnl_dump_filter() does for rtnetlink dumps.
> 
> The receive loop is shared with mnlu_socket_recv_run() and
> mnlu_gen_socket_sndrcv(), which behave as before.
> 
> Reviewed-by: Ivan Vecera <ivecera@redhat.com>
> Signed-off-by: Petr Oros <poros@redhat.com>
> ---
>  include/mnl_utils.h |  5 ++++
>  lib/mnl_utils.c     | 58 +++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 56 insertions(+), 7 deletions(-)
> 

...

> @@ -120,6 +143,12 @@ int mnlu_socket_recv_run(struct mnl_socket *nl, unsigned int seq, void *buf, siz
>  	return err;
>  }
>  
> +int mnlu_socket_recv_run(struct mnl_socket *nl, unsigned int seq, void *buf, size_t buf_size,
> +			 mnl_cb_t cb, void *data)

fixed the line length and applied the set to iproute2-next.


