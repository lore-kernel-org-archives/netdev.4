Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455072;
	b=QlaEl4xFjR70lTDRKg0iFGYKXqpz/h9wq4A7zo1CGS6V6et5f93GTxvv36U8os02DOCT
	 usL3LiwaQ0/2D4EJJpkSLZVoMzYaFCySftFruxWU2jgDKVvgSrEUnKaHdWMFZuR0Eg5/8
	 UBtYNOcl0OqvcO2SRJ3kX9yObYQgMsxCDk6CEDxIUYx/y9zO8VJtcZVvNxhn1gwRmIMtP
	 HNc5Cj8d8mOLk3BAmx6pWRZA4RjbOTZAGKDhcbPFMjTCpnk0YuAVOTRIPRBU82StduRGi
	 3+MyZVKz5JLMD2zeYmRbRcJvB0LpBD2fA2k6DOL0z5VFCTcYKFwPCD63m0g1OFlPxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NDXV+Nm5Mm1niJkS9ZXaHIuAQTJzwJplJzqN2/utdEQ=;
	b=C6PfQlmoXN8CcXA5Qh9mPvvJOW8O15/RFeF0uX7ybGO/JDDBB6wUpJ1RvwlxHDFC2XjY
	 6M1tAOqyd8Iynq0qgN2veOp4wzr5MH4m94wLbaUnVP/Hu/f5LLTbacjXH7D32OCZm1OOD
	 f2SXegoo9emvimMmY9MMgmN2YDtTJ9tBGe/9OZ8Jy1uPFkOGijHhwOU52ILYCrKu+fhK0
	 Vf2gs6dBtvOl2OA/I0H2esBiO84ywBXxVswFzsOIEOE3+7e3SIWzdkupJFC+mq7D6Xdqq
	 XQtZAqbb9viQ5RI/VLRk7oRUaschYM/3Nw3pr/Fxk3p/QyRvLnzp1WEjjAG/U+CVhWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cx1EBPdH;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B754F606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B754F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cx1EBPdH
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so3196881c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455071; x=1796059871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDXV+Nm5Mm1niJkS9ZXaHIuAQTJzwJplJzqN2/utdEQ=;
        b=Cx1EBPdHga5jlt2SjqKNpQtqu6aqFx6LNpl5EiH4stAuFap3lNRzzkX+Ey7dtfvlRW
         T4eaewqZkWCrJi9iYUI0Y4BzqM3WVKpkGJIGVAwH+e2+On7e5iO9BJS3NpjPIs6fRIoZ
         JtUpwaM0LH3X9++WfQYuP52HdjlwqN64Q5GOS1llg6DBLWnJRmnv0GVzcN84FMQrppFV
         116DiSP5BOl/ha+1spvrQYJbGxQhg0Q4iSbF+hcp/mzLDIluuvGfQByZv6WSorHxliWw
         ze7UWOLQ6a8Mz3N4EiCGhK4X0yiz3cXv6fGekcsQLefF3E8e9EFQAn1EJNxv4TvjMEnw
         qJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455071; x=1796059871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDXV+Nm5Mm1niJkS9ZXaHIuAQTJzwJplJzqN2/utdEQ=;
        b=Wg/m0AuidNLCrpKTo9nAeo4wVY1lFxOIC//bCv+1rWfvi0LCRMJQB60EQNwK4x8ZVz
         GhgbEcOiWTZsR1VB9BCK4exA8Sya8c4035RqMIocUXFTzwWPef4LP9S+I5EnOj34jSRo
         m74kjJNbWF0YZy17WG22I5vWzrMihDX5crxvlTto5+gvj9ahZRAg9lzuh+kGh7Ggi2zq
         llqo1W0n5W40NT0FfR/I+8Ytnace0L4nG15cwQDCxlgN7WZTxBybZSwEzKUKYlfnjb0e
         gCTjwHyrSu3FSo9FjJm384H7YrQ234RSonxttDhe9auTSG5iNOiOfOusfbhZjfvZBbHf
         niWQ==
X-Gm-Message-State: APuU4Z+KSBxbGX7BDSAtIITvuY2mdGPYyDBCx9xz6jzHsup3t79VfquZ
	BmjkbHnQRJQPTlGRUkuC9nr3agH+pqCkKTgqCMGXYWzIaAdL4oDsBpUb
X-Gm-Gg: AZFdTZfMNSCCZZv2j1rxqFLYvF5r77jY3eeaEhW1Ell3kq9Iflb4RfJC5atI8HubyiE
	VbRwJg00rxVPzTJWL8l2gyPxIXlBye2Rv4N+PIbiCHA4bWx4PoxYSTibFaUprJ0I9QMrgu8MWXD
	s4SQ2sKkG8QMjgqYPWZL/3nq83/HdZN591eKbZW2JcXD93VQuN7amMyJHeuC836nLfui4Tpwaxt
	qRNtwymvnEqu6o9hhV5hJgg+eTc+HnODFRY659znlGxvRktfD1I9ATAXO6HslnKGluTa1dyVLhq
	chAxXCHuUaQfatUzp6H9c25FtYa4qx/wKJZBy8UJd+IAU+CPvlNqO8w81oYns5Nkv6e1c3xFBHG
	SiaSVTbYtJCCeZUshB3lhPWukZCBnytpadTPeqZLGF9oeyqr9MUNgepWrFkcBcMPwHcUxWABDD3
	ZDhHfHGgi0dNyzqk6UJfYpGZTUHjCEDkJom9zOYizQOH4nOeHWnFA21V4isVgGQukCXR8NX9nPr
	Mkr9d6Yz085tS61j7kDVjwZRtNRz5Nkw33QCqk2Y6jcR5JSCNHNXBUEDJqRtYoAe2U0M5DrxMpS
	wkmqpeb09UzCha8IJzVhCLQ=
X-Received: by 2002:a05:701b:4513:10b0:1b5:56d8:d596 with SMTP id a92af1059eb24-1b556d8d6fdmr12628816c88.12.1795455070376;
        Mon, 23 Nov 2026 09:31:10 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm30278820c88.12.2026.11.23.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:31:10 -0800 (PST)
Date: Mon, 23 Nov 2026 09:30:45 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 6/7] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <awR4RQ3BPPg+xfDD@devvm16445.scu0.facebook.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
 <20261120201408.3445445-7-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120201408.3445445-7-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
> Prevent coalescing, segmenting, or shifting skb fragments from
> incompatible memory providers or different devmem bindings.
> 
> Add skb_mem_provider_compat() with an inline fast path checking only
> skb_frags_readable() on both skbs (unreadable lives in
> struct_group(headers, ...) alongside header flags already loaded in GRO
> and TCP coalescing/collapse paths) and an out-of-line slow path
> __skb_mem_provider_compat() comparing the net_iov provider instance
> (net_iov_owner() for devmem bindings, niov->desc.pp for other net_iov
> providers such as io_uring zcrx). Enforce compatibility across
> skb_try_coalesce(), skb_gro_receive(), skb_gro_receive_list(),
> skb_segment(), and tcp_skb_can_collapse(), and add a
> DEBUG_NET_WARN_ON_ONCE() check in skb_shift() matching the existing
> pp_recycle and decrypted assertions.
> 
> This issue is theoretical and was found by manual code inspection and
> LLM review; it was not triggered in production. Verified with the
> net_core KUnit test suite; not tested on real hardware.
> 
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
