Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069527;
	b=sY0zhgdm3Zt56jQzPixRrGQk6FTek3Tx1TMjchTBHr87Ind07G8P2pIyi+N5dou2tl/s
	 ENNLtJMa4mKQtqv+3zyCOajX9orZ9QtE+fr5pQt99u9QFRJtpnYfySXxdaTZE3Ac1jyiY
	 Au550J3PMzlFgM05R0R06KwZTYR++nvtec7Tp1Ut9fVS+tPCc1rgdgca640EHdO4p7vtP
	 D/FXLPxnZsnsTKLLAYkPrjCX17gqH0USQP+lvn/Uz9f0tYROkt/bfmOpi9T8HZbSSCgpd
	 TGAHkOpxiEvncoE2GBHcIl8BzWN4/1P6QfJZAOgcwgNtodRIGoJNWui3QgZHrnubGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3/jCbkLsS4OGDXUOa/6hUNYQQjlO6TzzhZNOu+cYzkc=;
	b=TIT8cst0t0NJ9f0CuWDl65AL+hwBo1LpPDhaLsdj9BQ3hfxBQsAs3Y7PaxLvHqfgI/ym
	 UU0h8vGFrWyEP3qyOXEwmarKtDaPGfSN3RHCDZ4n+iQf5SMlQMg8JQB+uYV2BO0Kbv96j
	 0MbdHlplO9Jah8Jkc/BbJ3TcJhCOMt7BTA7uw6VDNigTuKhPhEb+SpIbaxMhZqxdtWdaN
	 /8PKWy/nPe5qd9Wuqb1Zc/00kr8tYqpeWjiKcdXCOrZZdjJoEuTjr5lfV0U0WI/odu1MU
	 R6uQD8o1a1CKUzErW/LaxrzHOirHGqpi4dv/7oHyWZJPeBGs70gCLB6lAdCUBd3NVNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DsrNb2t0;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84F606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D84F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DsrNb2t0
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so16730335ad.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795069527; x=1795674327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/jCbkLsS4OGDXUOa/6hUNYQQjlO6TzzhZNOu+cYzkc=;
        b=DsrNb2t02IODLijhWdu7RKB6d0nUCCWQT9Ri1w3QwWzqQROAWLnzG8L5y5/0yzdkM3
         Hk6/6M6r6kVP0+k2iA4Z+P0zIm9OzzKb6yXYvCmNShBYqBxperO53Aclo76atEkc7HsL
         RsZaUAT9ZyRj8AD6GTuCQyTb9zEktyG3JuRBCOhX8/1rE7PHN3i5eQTHPxeOyr6hkpMa
         W5eOrPgZQ67LztrcdqYopVvXSqFBYNvSCnXwtqHgtwOKS3JXxqg9n2E1L9uxUST6ae77
         T74V8VZYgC6VjcZmGnLXFjHy0mpDGnts3QcH2fXZhSRxdfiEIn+daLA8kiM3b091lVyK
         E5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069527; x=1795674327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/jCbkLsS4OGDXUOa/6hUNYQQjlO6TzzhZNOu+cYzkc=;
        b=xu7qFOA75GI2Ssjeyl6Fq+867KMxb9T5sS0hVxXZNaMz+HHzTduZt8okpSjlwNXpir
         ynxnHm5uqEXAJVR6fJ3H2aqZstWHoc5sWjXxm0WNwpSIVbGRR9lN9OP7XN1o75EYyfmE
         4NuTMJps4JhlYiiAdH4O7VW78Hgk+04LQI2hCL2+07MvJPl8/RdErUEjUqF885JhwrNE
         cduPhuJdqpUXN2hCEHRHr6Vu0e8gaxBa0Yzddy/xPXeB/WPnZwdUeflCFFu5hXxQ42aI
         rxZd+e7OFGjNcJAJKs1dMskqqXQD2XTbQkFKgpArRV5Bv5ndZFFBrQJ+sbDWGezpZbzQ
         sXqw==
X-Gm-Message-State: APuU4Z9aCirAfkGPWaUQnNpWIvQQ+sk0VGFaevvwnsoyoSSxyvvH6pL9
	WX0zM6hZUI0YK0tmZs5nAtLjGGPLOcDzP8cSpjoEoYCiZ/ZlqgsDmMji8Id8DGi8HjgU72N4TJc
	6E/N/Xw==
X-Received: from plbkp8.prod.google.com ([2002:a17:903:2808:b0:2ef:f76f:c4])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54e:b0:2ef:fcd8:df75
 with SMTP id d9443c01a7336-2effcd8e214mr45611785ad.36.1795069526782; Wed, 18
 Nov 2026 22:25:26 -0800 (PST)
Date: Thu, 19 Nov 2026 06:25:25 +0000
In-Reply-To: <20261118153541.172499-1-shlomojune6@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118153541.172499-1-shlomojune6@gmail.com>
Message-ID: <av6WPnah6aodSmuh@google.com>
Subject: Re: [PATCH v2] net: sock_reuseport: check program type on the
 migration path
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Shihuang Liu <shlomojune6@gmail.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, edumazet@kernel.org, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 23:35:41 +0800, Shihuang Liu wrote:
> A BPF_PROG_TYPE_SOCKET_FILTER program can be loaded with
> expected_attach_type set to BPF_SK_REUSEPORT_SELECT_OR_MIGRATE and
> attached to a SO_REUSEPORT TCP group.  Closing a listener that still
> has queued children then runs it with a struct sk_reuseport_kern
> context even though it was verified against struct sk_buff, which
> KASAN reports as a stack-out-of-bounds in ___bpf_prog_run().
> Reaching this without CAP_BPF requires
> kernel.unprivileged_bpf_disabled=0; with
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=y, the Kconfig default, the sysctl
> starts at 2.
> 
> reuseport_migrate_sock() decides from prog->expected_attach_type
> alone, a field user space sets that does not identify the program
> type.  Require BPF_PROG_TYPE_SK_REUSEPORT there and in
> reuseport_stop_listen_sock(); socket filters still work as
> selectors, so the selection path is unchanged.
> 
> Fixes: d5e4ddaeb6ab ("bpf: Support socket migration by eBPF.")
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
