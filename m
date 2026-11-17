Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935971;
	b=ADBVG456lxyk5FFNznUAnDVvRaTzb3l/IaEyfF4W7uhT9BpGCfHlyu9ubiu1cXVxUadA
	 UYCYXk86PBYEazx7np14tVJsI8fFVaJy958fmap67wBPWpuXBD2swsBPFJ8fY61kniW+I
	 STVCJeBWHrbSR9mBjGyv5zczWN+t/fq2HovKz8pmEqEi1f1/NOSGiUViJTZHOi4u+z6Yr
	 ckPAd/wZtv49J85p9QQSlV9zpjOeAVLh1VfT0TVzmDtZQ1qK9yiz+9vfrsXPql/+EDqoL
	 +CTId7H2PlxyjvW4XsdYF1e/JFyDHjGt6Ycep2KVNndS8fCks5RvhhcBRDvRKLZjiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935971;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W4aFLpUfe3XiCxc2PObsnrTodftdXNUU558nT7u5UfA=;
	b=DPYCbtdBxsU9DBih113IQ/HA4GNNsmGTukBrQofg2eyZHaJ+HsG8RqH2yX6uBE/eUsw9
	 znAshFE9HtI122HGMISSIqwO5XhVJjm6aDFjUYjgaur9IiVWEKnsUhw6xT0TLDYDn4QnT
	 tlYxTnM9s59nSycfjr2aAZCFtSKhIlgprmdMUUpVNFKfgjFLBILpVQwpaJDoRkCeaumot
	 IpjM990JdHHo0N95RzwAUAsQ0M7QmbTd2ndxC5Ja9vjH+DTefTrjwFDj2s3tX3EZHY7nj
	 f3XjOhlS6wOQF5tqO2VJQ6JY9xD/prZLAbr680lpKqx7fpCP609CbM1bkzsRJC45qoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhPn3cKi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC1606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhPn3cKi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDD61F000C4;
	Tue, 17 Nov 2026 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935971;
	bh=W4aFLpUfe3XiCxc2PObsnrTodftdXNUU558nT7u5UfA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mhPn3cKiaaWVfVod30aryF66cjFtwpMWtSD7EAF+Dx5DLDSPA4B7MzhrAOYpILqqI
	 j8BPCfb2MuYSLnGkwJwjcZbIPQ2N1cGHHY2WMB16aCIor2MBcvxNXg0nElreL0E/g5
	 uIn3EYM+QMtyV0wa5NgahDSueomWtVKgndr/xgliHb/y1d7+aGjpGzfoLto1weTg3C
	 J5yr2QdgbuAMESFYB9ytj0T41BuY3wlNLJs2+dTOv9HnDPTOgUPyRfkbaLYRioIWjH
	 ug6ncJoPTnwVWCd4sBf/YqP/E7HuId6xU5gSqoVHbwxC6RXojGQhkNMC251XY/Ewms
	 btoc4xPnGdwAg==
Subject: Re: [PATCH v1 net-next 1/4] selftests: landlock: Replace MSG_OOB with
 O_ASYNC+F_SETSIG.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Tue, 17 Nov 2026 17:19:30 +0000
Message-ID: <179493597059.3136.12928298602383914551@kernel.org>
In-Reply-To: <20261116021845.2533130-2-kuniyu@google.com>
References: <20261116021845.2533130-2-kuniyu@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] After this patch, no landlock selftest reaches
  hook_file_send_sigiotask() through send_sigurg().

--

selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.

This commit removes MSG_OOB from the fown.sigurg_socket and
trace_fown.deny_scope_fown tests. They now do a plain send() to a socket
with O_ASYNC and F_SETSIG(SIGURG) set, so they no longer depend on
CONFIG_AF_UNIX_OOB. The commit also drops CONFIG_AF_UNIX_OOB from the
landlock selftest config, and it moves the close() of client_socket later
so that no extra POLL_HUP signal is sent.

> diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
> index 259cdcc8aa5cc..c4c365007370a 100644
> --- a/tools/testing/selftests/landlock/scoped_signal_test.c
> +++ b/tools/testing/selftests/landlock/scoped_signal_test.c

[ ... ]

> @@ -560,20 +539,22 @@ TEST_F(fown, sigurg_socket)
>  		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
>  
>  	/*
> -	 * Sets the child to receive SIGURG for MSG_OOB.  This uncommon use is
> +	 * Sets the child to receive SIGURG.  This uncommon use is
>  	 * a valid attack scenario which also simplifies this test.
>  	 */
>  	ASSERT_EQ(0, fcntl(recv_socket, F_SETOWN, child));
> +	ASSERT_EQ(0, fcntl(recv_socket, F_SETSIG, SIGURG));
> +	ASSERT_EQ(0, fcntl(recv_socket, F_SETFL, O_ASYNC));

[Severity: Low]
After this change, does any landlock selftest still reach
hook_file_send_sigiotask() through send_sigurg()?

fown.sigurg_socket and trace_fown.deny_scope_fown now reach the hook only
through the send_sigio() path:

  sock_wake_async()
    kill_fasync()
      send_sigio()
        send_sigio_to_task()
          sigio_perm()

The sigio_to_pgid_members and sigio_to_pgid_self tests in the same file
already cover that path. They use a pipe with F_SETSIG(SIGURG) and O_ASYNC.

The other caller is still in the kernel after AF_UNIX MSG_OOB is removed.
It is reachable from tcp_check_urg(), smc and x25:

  sk_send_sigurg()
    send_sigurg()
      send_sigurg_to_task()
        sigio_perm(p, fown, SIGURG)

The hook in security/landlock/task.c still names this caller:

hook_file_send_sigiotask() {
    ...
	/* Lock already held by send_sigio() and send_sigurg(). */
	lockdep_assert_held(&fown->lock);
    ...
}

The trace section comment also still says "Trace test for the asynchronous
SIGIO/SIGURG delivery path".

These tests would keep passing if send_sigurg_to_task() stopped calling
sigio_perm(), or called it without fown->lock held. The later patches in
this series (the sockmap and af_unix MSG_OOB test removals, and "af_unix:
Remove MSG_OOB") do not seem to add a replacement test for this path.

Could these tests use TCP urgent data over loopback instead? That reaches
sk_send_sigurg() without AF_UNIX OOB. If not, could the sigurg_socket name
and the comments be updated so they no longer claim send_sigurg() coverage?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116021845.2533130-1-kuniyu%40google.com
