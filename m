Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692755;
	b=Djz9o+g20qqr0PewJxhd5kE5ewDio+NEH7okQXn5aObdOLKl8hyFYNtUWx+K5ORk5Kyo
	 4NOVcCot7RGZ0B4OcZtDMnKjvS/+MFxFZR6oTchIks0mhdvRvFCgUJ3ysmgnt+JE2jppd
	 obTKx6fH+xNBg5kz3dJ6anWS3InXTECay6NKuSoPtuYWDzfdPB8qsPZiNBwGVavSzrPXc
	 81+ggibnllZ9IUSad+06tmrzox4TSHUc2NAXgfcXexnw1VIub/wK9Grr4QEJpTp9nCNAH
	 qM7Oo+V5RZYZccjaY912Jvb+HWUFYFQX4nsXVnoXSl4PAzqaWzFJi/a38gfwspzFTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692755;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=a8k6Fx0FJCpMnoYcnuhUjDi5goy0swCnhGb9i73dsQM=;
	b=0CZ7FtQujnGW+UqRv3T7qjiNyX3tklFtrsjTyGkBB2+PTQ1mSvUN3EY3FUQ03y5H4/ib
	 UoZUAO0o59DFfN03/9NSFF7/xLIW8P/wpO38UuyS4yzfdU+d3/sNy+gZYi8mh8MMgjeXk
	 jWDmqpvN5i9dmJuBTT3WdmNT4KwRTnxNxlibeOvbAli9wKKELX1dkVqjQ1SrGqfKyTLpz
	 FY/6qWpRPIbFc9Kkc0r8DKih7mvFCW2qZfXk+ndV9Jfe2hlsoS+he0x8+v+XT0QwaN+XT
	 /bF2ujwxa6i4ViaDfd3Tw1GycLS2r9vRJIIYFkhWjJsPRsUOM6BUR9vezIdXpFqJl2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=EKvsTepF;
	arc=none smtp.remote-ip=195.10.208.40
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA925606A6A9;
	Thu, 26 Nov 2026 11:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA925606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=EKvsTepF
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jZvXp1XdBzFptY;
	Thu, 26 Nov 2026 12:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795692746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8k6Fx0FJCpMnoYcnuhUjDi5goy0swCnhGb9i73dsQM=;
	b=EKvsTepFHvhC9EwfUOnQ/KkycLGgS0+wJKKiKWwlH92/FZxcYQKJJSHj1QwTU56y0nhK4/
	qe3CLcACBYdhF+/RH07mVqTBhzimePdP7zPi7fZYIscz2BxaeSZ1JWAmhaj44P4yYzE5su
	Qmf8sGeh793Um1/A+Fvxx35jzsdBkI+TR0JtJEmsYXURyAPKfp6BPDmLKieM7YaI63QFQ7
	uPMy5GNuYc5Td5bM23Xoc4tEtaDx24Em23jJAdI1i5PxREu7fOX4Wjj8FpjNwl2UCcPQ+G
	ucPAoyUmNc8Ql2zK6Lm7bdhyoo+ovfFk5sp4F9SOUJbg/eZvhQYL2H2FxpVm7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev-bot+sinfo@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: advance the route generation when policies are removed
Date: Thu, 26 Nov 2026 12:32:16 +0100
Message-ID: <20261126113216.337964-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179569192472.3294.16207945676550617931@kernel.org>
References: <20261126111516.317545-1-ralf@mandelbit.com> <179569192472.3294.16207945676550617931@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jZvXp1XdBzFptY

On Thu, 26 Nov 2026 11:18:44 +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>

Yes, the policy removal cases were triggered at runtime, in a VM test
setup (not observed in production AFAIK).

There is no kernel message, the symptom is plaintext on the wire. A
connected UDP socket keeps sending unencrypted datagrams after the allow
policy that exempted its flow is removed, although the ESP policy below
it now matches.

This is roughly the setup, in a netns with a veth pair (IPv4 is the
same):

  ip xfrm state add src fd00::1 dst fd01::2 proto esp spi 0x1001 \
  	reqid 1 mode transport aead 'rfc4106(gcm(aes))' <key> 128
  ip xfrm policy add src fd00::1 dst fd01::2 dir out priority 100 \
	tmpl src fd00::1 dst fd01::2 proto esp reqid 1 mode transport
  ip xfrm policy add src fd00::1 dst fd01::2 proto udp dport 5002 \
	dir out priority 10 action allow

A UDP socket connected to [fd01::2]:5002 sends one datagram, the allow
policy is removed, then the socket sends 10 more, captured on the veth:

  removal               net-next             ipsec + this patch
  delete by selector    10 plain, 0 ESP      0 plain, 10 ESP
  delete by index       10 plain, 0 ESP      0 plain, 10 ESP
  hard time expiry      10 plain, 0 ESP      0 plain, 10 ESP
  flush                 10 plain             nothing sent

The flush case replaces the ESP policy with "ip xfrm policy setdefault
out block", so that nothing may be sent once the policies are flushed.

The xfrm_policy_insert ordering is a race between the insert and a
concurrent lookup, found by code reading. That I did not reproduce at
runtime.

I can share the reproducer script if useful.

Thanks,

-- 
Ralf Lici
Mandelbit Srl
