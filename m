Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935973;
	b=dwSICrKcTMTMLvSqUVn/z5MvE9Y61WDXkMXRcV/pZsphXbSqXxxamnF0qP48ahJVRrKY
	 m9cmhQ0c0JkQ4wKI8wwpn8Up/AvTBf5cRBLtS+unbcEBLURPd+dJxVht3ksUDnMjfZEpb
	 LmYKNh3Men+URgpab75PnSwyorKoW+6Naq+rsE4cwyUI3oUve0mIawNw9Yu/C2hx1sPjV
	 Whva+QcHuarPK3fY1lBT3OR99BmufyHMDDbtX2IOCtfglFL/MQv23FYV1x9Zo/tNCJTHC
	 cCB/D/nRLB0ZxMm1obMAxPBH7RBpxXmurpYjIsfOacseuelttjxTGx02YORD+XL7U/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935973;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9l6zcAg1B3bJEjfNjcishlLBIg+UhItXqaIMzVkYgFM=;
	b=5EbvQw1PB/Tdd7T/62wkYp+u10zcjH14ec9EVKhCMdSWAoWafb6AxFh1PEim56Ugw8Yq
	 oPRcLZ6XBcvkOaBBD4nzv4MQeAA4AhxEe9uVZODFQryJ34FUJiIT0CSDJ9rP1A8G9q+IR
	 86we3Op2PNwVwLE5+dBguq1M+AnAEMUMnjptjxQPrwKI4HUYPdbVRc8REnBwsed6ogBxv
	 XuyfAwmYgWpNKByg3qlHdnUW8d3YbsdC6V6x10sWvvCycvx6JdQMr/nCRtzJqL4jBxrBv
	 fXbN5xuls5rUpwXDQn9CeTtUr1MI3H4ARWp9SC6XbHmQ6P0RurMmepiifPTjhVMQ/UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgJcx+Wi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B507606A880
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgJcx+Wi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AB91F000C6;
	Tue, 17 Nov 2026 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935973;
	bh=9l6zcAg1B3bJEjfNjcishlLBIg+UhItXqaIMzVkYgFM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XgJcx+WivqJ0da6ZRjR9+8c2lhUd/uL+AVBQeMEHNmzi9V+7mb2dt2rzNXn6QKjbN
	 Cl2qAhJya70PDyLY2tO5iPQKlbWH7Cjeq6D3W2X8bX3pAoxJc1FcGgmZMzq9Q0VmxT
	 UW5Ur9raEeLBY6F+gQOOlJDmGxy05FBxtyRS1KtZpm290VzNaU/njyWG58VeGUomHW
	 9VcAkCwUZYOnx85MwvCE7zhZcpQ1YAYAVhPAr0wZCaOv/G9IopcQJNfK+/FJPeB6Qo
	 dbrIXlQzweAAt6Y10tFEXKh5+8ljC5TaWtyVsxrbxl/j75oxixYCUB32wnV5hbwmIh
	 G4DKjQD+pDirQ==
Subject: Re: [PATCH v1 net-next 4/4] af_unix: Remove MSG_OOB.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Tue, 17 Nov 2026 17:19:32 +0000
Message-ID: <179493597266.3136.6471867064840750751@kernel.org>
In-Reply-To: <20261116021845.2533130-5-kuniyu@google.com>
References: <20261116021845.2533130-5-kuniyu@google.com>
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

- [Medium] This patch removes a userspace-visible AF_UNIX feature with no
  deprecation step and no evidence that nobody uses it.

--

af_unix: Remove MSG_OOB.

This patch removes MSG_OOB support from AF_UNIX stream sockets. It also
removes the CONFIG_AF_UNIX_OOB option, the oob_skb field in struct
unix_sock and the SKB_DROP_REASON_UNIX_SKIP_OOB drop reason. After it,
ioctl(SIOCATMARK), EPOLLPRI and SIGURG on AF_UNIX behave as if
CONFIG_AF_UNIX_OOB=n.

> diff --git a/net/unix/Kconfig b/net/unix/Kconfig
> index 6f1783c1659b8..d378726d5eb92 100644
> --- a/net/unix/Kconfig
> +++ b/net/unix/Kconfig
> @@ -16,13 +16,6 @@ config UNIX
>  
>  	  Say Y unless you know what you are doing.
>  
> -config	AF_UNIX_OOB
> -	bool "UNIX: out-of-bound messages"
> -	depends on UNIX
> -	default y
> -	help
> -	  Support for MSG_OOB in UNIX domain sockets. If unsure, say Y.
> -
>  config UNIX_DIAG
>  	tristate "UNIX: socket monitoring interface"
>  	depends on UNIX
> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 96c13682938e1..cc5c7fa40b4d4 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c

[ ... ]

> @@ -2403,12 +2334,7 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
>  
>  	if (msg->msg_flags & MSG_OOB) {
>  		err = -EOPNOTSUPP;
> -#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
> -		if (len)
> -			len--;
> -		else
> -#endif
> -			goto out_err;
> +		goto out_err;
>  	}

[Severity: Medium]
Could this break existing userspace on kernels built with the default
config?

The removed AF_UNIX_OOB option was default y, and its help text said "If
unsure, say Y". So most kernels since v5.15 have shipped MSG_OOB support
for AF_UNIX SOCK_STREAM sockets. On those kernels:

  send(MSG_OOB) queued a 1-byte OOB skb and raised SIGURG on the peer
  through sk_send_sigurg() in queue_oob()

  recv(MSG_OOB) read the byte back through unix_stream_recv_urg()

  ioctl(SIOCATMARK) reported the mark

  unix_poll() returned EPOLLPRI

After this patch, an unprivileged process that calls send() or recv()
with MSG_OOB on a connected AF_UNIX SOCK_STREAM socket always gets
-EOPNOTSUPP. The send side fails in unix_stream_sendmsg() and the recv
side fails in unix_stream_read_generic(). SIOCATMARK now falls through
to -ENOIOCTLCMD in unix_ioctl(), and EPOLLPRI and SIGURG are never
generated.

The commit message says plainly that these features go away. Its only
argument that nobody depends on them is "there is no clear use case". Is
there evidence that no userspace relies on this behaviour?

Would it be safer to first switch AF_UNIX_OOB to default n, or to warn on
use, for a few releases before deleting the symbol? With the option
removed outright, anyone who hits a regression has no way to turn the
feature back on.

Inside the tree, the series looks consistent. Earlier patches remove or
rewrite the selftests that used MSG_OOB: af_unix msg_oob.c and
scm_rights.c, the bpf sockmap_redir case, and the landlock
scoped_signal_test. No references to AF_UNIX_OOB, UNIX_SKIP_OOB or
oob_skb remain.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116021845.2533130-1-kuniyu%40google.com
