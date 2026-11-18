Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965862;
	b=NPhGPtx1EzRgtG7xm1obtbnOLig5eeKQF8l/ad/dqq192i2lI7ZZV/PGK3gnBLMZe/bu
	 aVixOcipWdmE9R3QvnD8nLnNzN55tmcyclUdI50owXJqrVkLFxgPEfcBtid0zgpp2ZQvJ
	 4hZUrJxJs5cg9DdRdkZo1SWZnoIA5dhAzDoNxiFN6AUDbZu7J0Pz9Emp13OPEl1OSbh5u
	 uup43PujAcHwqEFjZIJjUARBwmNEW5ztPDI16kvxn/0Qk0wuoG170OfIfOcMbS8n2J28J
	 gfRUmt5P1Hl26zJSjcFFyBf0sqy/pRDhiQC78otLWmBdO+THmpY911hhfIlRCgBzmHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I4+HqrPTfNX+F70ALAg3GuBcwTzAIRTuUai1lT7QNOU=;
	b=V6J7b95FY167xITc7AhXOI5twNBufVKnW10Bd4liujbuPF81UOJ/ZRZAcq+jL5Bhhl+D
	 Ych+M4X4n9pU4kKHsgPwzXfZEa7cCLaaonl/uDT+uTJrdAHukUJnTazkY63qjPsrDMxlF
	 opXMv8flSjYZIhVST1d5qgf8pzNqL8xVULsRdmReYd4uSzUkcY10SH/B5wVqXGd+WSm2o
	 v0RmGslqYInoMvbEGcZjyoL6kmf0eKGeWfR7005YWy2rolq30+mEZ/ipbeng5VeTkCJdP
	 URhA9yzSrDGvPi/AOu4Xz17myYbfTaRdnBWhvJAgejVCIByC5gn65LMX99DIpH7Lq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aSsoOBOQ;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5334606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5334606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aSsoOBOQ
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so297044a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794965861; x=1795570661; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4+HqrPTfNX+F70ALAg3GuBcwTzAIRTuUai1lT7QNOU=;
        b=aSsoOBOQrCIxCuljMcPbU8NwchYVNzIwyq0ogzZurmGPNRuaVDoVrbHnh+YZrHDjbI
         keNbLDo8rqXKwxWt/sJoT9MMyDpoJ71b5z1m8kN9yve5kk2XSeqHNVoZqswN6yWpznbY
         vCDY9vHCjy68bT0j89F5OdwIhZE5X1xnkaUXuto/+pnVEgrSr1XNQgnekjDmpHa6Chqk
         gF53tNtdW0DmoetyJhaHM08wx7Ns3qBpOy9664umUZbdnu0b1weJZg+P0/XMqiwIPFON
         4CryJVUns3rvfQvXmQqzs1v1xhEHSlgpStxNcky8q+nMXVTfr8/g4Vde8deKElJbaA3s
         NGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965861; x=1795570661;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4+HqrPTfNX+F70ALAg3GuBcwTzAIRTuUai1lT7QNOU=;
        b=UQebR3eCBXNm34+zBPAniqyxTrrqUwtYdnSwu6FpKtTT63nazUma8LZ5FjIWhaZW6i
         Oxx8cKkvbar9IRuZ1OzoiPTMOqxqVrdMaRGNLKSSnMqU7rFn93N5NMeSn0S0R3wOVa9S
         xXnjXmGb7n6L/SHQl+S/Mn5uvX01pgVlIax0W5EC683D1ORVZC3eKS0uId1ISn1eoHnW
         z5Cq4G54tJpzxey9yIDnsA26hDGLRnnntGrB8UW/xVEl+vOlqVRxIWqqrgF7hJUQLpVo
         TzJkJxeE48RdCPPj7ySft74+xKevRoLNkaBAc9LcCE0l1xoVhSr+1y65fjT8+bLu3n42
         whUQ==
X-Forwarded-Encrypted: i=1; AL+hErGQNYT8dgscvuZZyCm0BRXsYEawAnuy99rcki/y7cfKeDOLjgYn3zEZyynsOWuCP9JRTGHaoFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vRkIlUt9rmhPTPD3niC611FZilnmpd4HwRz/zINoM3g0paSLh
	RQ4wPKLqivh5KytfVhe9MGrcxFyRmYQzeV7TELTMABpa0zzRzz7AX9LFaNdaQwpBzG12as4dYuO
	OxdIgqg==
X-Received: from pji6.prod.google.com ([2002:a17:90b:3fc6:b0:3b3:af68:f961])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2642:b0:3b3:ab8c:c7e5
 with SMTP id 98e67ed59e1d1-3b3d07da2afmr1088213a91.56.1794965860817; Tue, 17
 Nov 2026 17:37:40 -0800 (PST)
Date: Wed, 18 Nov 2026 01:37:40 +0000
In-Reply-To: <179493597059.3136.12928298602383914551@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-2-kuniyu@google.com> <179493597059.3136.12928298602383914551@kernel.org>
Message-ID: <avz7dRCjnwSTe7LD@google.com>
Subject: Re: [PATCH v1 net-next 1/4] selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 17 Nov 2026 17:19:30 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] After this patch, no landlock selftest reaches
>   hook_file_send_sigiotask() through send_sigurg().
> 
> --
> 
> selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.
> 
> This commit removes MSG_OOB from the fown.sigurg_socket and
> trace_fown.deny_scope_fown tests. They now do a plain send() to a socket
> with O_ASYNC and F_SETSIG(SIGURG) set, so they no longer depend on
> CONFIG_AF_UNIX_OOB. The commit also drops CONFIG_AF_UNIX_OOB from the
> landlock selftest config, and it moves the close() of client_socket later
> so that no extra POLL_HUP signal is sent.
> 
> > diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
> > index 259cdcc8aa5cc..c4c365007370a 100644
> > --- a/tools/testing/selftests/landlock/scoped_signal_test.c
> > +++ b/tools/testing/selftests/landlock/scoped_signal_test.c
> 
> [ ... ]
> 
> > @@ -560,20 +539,22 @@ TEST_F(fown, sigurg_socket)
> >  		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
> >  
> >  	/*
> > -	 * Sets the child to receive SIGURG for MSG_OOB.  This uncommon use is
> > +	 * Sets the child to receive SIGURG.  This uncommon use is
> >  	 * a valid attack scenario which also simplifies this test.
> >  	 */
> >  	ASSERT_EQ(0, fcntl(recv_socket, F_SETOWN, child));
> > +	ASSERT_EQ(0, fcntl(recv_socket, F_SETSIG, SIGURG));
> > +	ASSERT_EQ(0, fcntl(recv_socket, F_SETFL, O_ASYNC));
> 
> [Severity: Low]
> After this change, does any landlock selftest still reach
> hook_file_send_sigiotask() through send_sigurg()?
> 
> fown.sigurg_socket and trace_fown.deny_scope_fown now reach the hook only
> through the send_sigio() path:
> 
>   sock_wake_async()
>     kill_fasync()
>       send_sigio()
>         send_sigio_to_task()
>           sigio_perm()
> 
> The sigio_to_pgid_members and sigio_to_pgid_self tests in the same file
> already cover that path. They use a pipe with F_SETSIG(SIGURG) and O_ASYNC.
> 
> The other caller is still in the kernel after AF_UNIX MSG_OOB is removed.
> It is reachable from tcp_check_urg(), smc and x25:
> 
>   sk_send_sigurg()
>     send_sigurg()
>       send_sigurg_to_task()
>         sigio_perm(p, fown, SIGURG)
> 
> The hook in security/landlock/task.c still names this caller:
> 
> hook_file_send_sigiotask() {
>     ...
> 	/* Lock already held by send_sigio() and send_sigurg(). */
> 	lockdep_assert_held(&fown->lock);
>     ...
> }
> 
> The trace section comment also still says "Trace test for the asynchronous
> SIGIO/SIGURG delivery path".
> 
> These tests would keep passing if send_sigurg_to_task() stopped calling
> sigio_perm(), or called it without fown->lock held. The later patches in
> this series (the sockmap and af_unix MSG_OOB test removals, and "af_unix:
> Remove MSG_OOB") do not seem to add a replacement test for this path.
> 
> Could these tests use TCP urgent data over loopback instead? That reaches
> sk_send_sigurg() without AF_UNIX OOB. If not, could the sigurg_socket name
> and the comments be updated so they no longer claim send_sigurg() coverage?

I don't think we want to play with TCP MSG_OOB nor smc/ax25 :)

also the intention of the selftest is not to test send_sigurg(),
rather security_file_send_sigiotask().

