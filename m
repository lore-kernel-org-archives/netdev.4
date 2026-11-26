Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716384;
	b=vrNcvWjF+yqx67dmZ90tzvyuCXVcNR4SJzzxHPKhtUe10S/CR7WQ5Ijthg4wkTAOUgig
	 EsIrUmYn9OAJlAFFJoSASObP/0cEttNyRmQVb6BcD9LD/GtSwRgjHzSuGdVgmD7+MkA3o
	 QRKxsbKTRUcpTiOeCZqXHIaefJyE79oammJZTNTsIcSObrDaKuzDcxpWgzEXo5kLoFo0T
	 ZIuu8P+F4FSR+xIRGMdfdesUg0mtVD4oz0VzfjBw0rYdk79FdDgSZgR6y8m28qFEYnXmN
	 KuVPgxqCqV9zQFyixqIQzPjAGVsGDjDD35BrxE33OBEldqR1iS89fA5W7hpxM1r9m/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716384;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=ZFYiheXa78vwZkfk3QiwkXHEnKws8Sfv2V6CLNUXJgM=;
	b=3EZiEiFEP53N5RYZw1qRS4Pr5mW5joirdRwywRc9P9PUaceLbQ6c+/+AKqZSVeIg7Dxc
	 JxjKi11elnqiTNxwHoI6qtR9Zrxqj8YFPSLDAP1qMslid5chfWUWG1Oi/7eXQq/TfoL0X
	 VVUYbUPX2/vJigD1YORhc5Kz0AaQB3/CaC1aRLrvPxhJX+1hVuL+Iy+BIrnghpJZm1sT4
	 lMbKx92NozJzekfeDECbPPFc2C+am5+UiC22XkJx37zUWTYc9oapdF5uEfqS1+yegeYXE
	 yLfbx5drjlg3VPN4mGPO0Tvhxr5Kgghf5eIWvsTNlZD/Ad7v24tjpa/FZmZFOqkSw0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=KQsLwA2y;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C95606A31E;
	Thu, 26 Nov 2026 18:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=KQsLwA2y
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jb4HG1cMCzk3;
	Thu, 26 Nov 2026 19:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795716378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFYiheXa78vwZkfk3QiwkXHEnKws8Sfv2V6CLNUXJgM=;
	b=KQsLwA2yqIXpa+5Untqa12L/CG9nzfaW/eHsyUg4EjUmFYdGQsRwEiuKe9qMccj1d/eEdX
	DTvT927J1OjN2XDHl9uYilYItII3GmSsyPeCkroIn/S8jnOKdNcRJQ/gmFuOmcjEcZ33uv
	YrX+7N4+26VFzyOqjzkJ9dMykFrc90hf3lJL+P+uzPZblfb8AkqmBKlHUdDLkgfsBc8b2W
	f19w9Le7SrwC108U6NcdS2xG2h8oaEj5rfk9qk3rOLA+Isj0hSYiJrqshk+j+8Z9sTKGyQ
	0jKSxTXlh17BKgBMg/L5UbCjSZbGYUVg5jqxZ8IP/yOcKYXPBb3oM9K1rVYxLg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: nicolas.dichtel@6wind.com
Cc: netdev-bot+sinfo@kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: advance the route generation when policies are removed
Date: Thu, 26 Nov 2026 19:06:05 +0100
Message-ID: <20261126180608.1459401-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f707be46-5332-4196-a9e0-5e6fb5ae8353@6wind.com>
References: <20261126111516.317545-1-ralf@mandelbit.com> <179569192472.3294.16207945676550617931@kernel.org> <20261126113216.337964-1-ralf@mandelbit.com> <f707be46-5332-4196-a9e0-5e6fb5ae8353@6wind.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jb4HG1cMCzk3

On Thu, 26 Nov 2026 15:54:36 +0100, Nicolas Dichtel <nicolas.dichtel@6wind.com> wrote:
> Le 26/11/2026 à 12:32, Ralf Lici a écrit :> On Thu, 26 Nov 2026 11:18:44 +0000,
> netdev-bot+sinfo@kernel.org wrote:
> >> Hi!
> >>
> >> This is an automated message. This series looks like a fix, but its
> >> commit messages seem to be missing some information:
> >>
> >>  - Whether the issue was actually triggered, or is only theoretical
> >>    (e.g. found by LLM and not proven at runtime). If it was triggered
> >>    please include the symptoms, like the stack trace or kernel messages.
> >>
> > 
> > Yes, the policy removal cases were triggered at runtime, in a VM test
> > setup (not observed in production AFAIK).
> > 
> > There is no kernel message, the symptom is plaintext on the wire. A
> > connected UDP socket keeps sending unencrypted datagrams after the allow
> > policy that exempted its flow is removed, although the ESP policy below
> > it now matches.
> > 
> > This is roughly the setup, in a netns with a veth pair (IPv4 is the
> > same):
> > 
> >   ip xfrm state add src fd00::1 dst fd01::2 proto esp spi 0x1001 \
> >   	reqid 1 mode transport aead 'rfc4106(gcm(aes))' <key> 128
> >   ip xfrm policy add src fd00::1 dst fd01::2 dir out priority 100 \
> > 	tmpl src fd00::1 dst fd01::2 proto esp reqid 1 mode transport
> >   ip xfrm policy add src fd00::1 dst fd01::2 proto udp dport 5002 \
> > 	dir out priority 10 action allow
> > 
> > A UDP socket connected to [fd01::2]:5002 sends one datagram, the allow
> > policy is removed, then the socket sends 10 more, captured on the veth:
> > 
> >   removal               net-next             ipsec + this patch
> >   delete by selector    10 plain, 0 ESP      0 plain, 10 ESP
> >   delete by index       10 plain, 0 ESP      0 plain, 10 ESP
> >   hard time expiry      10 plain, 0 ESP      0 plain, 10 ESP
> >   flush                 10 plain             nothing sent
> > 
> > The flush case replaces the ESP policy with "ip xfrm policy setdefault
> > out block", so that nothing may be sent once the policies are flushed.
> > 
> > The xfrm_policy_insert ordering is a race between the insert and a
> > concurrent lookup, found by code reading. That I did not reproduce at
> > runtime.
> > 
> > I can share the reproducer script if useful.
> Maybe adding a selftest would be useful.
>

Sure, I'll turn my reproducer into a selftest and add it in v2.

Cheers!

-- 
Ralf Lici
Mandelbit Srl
