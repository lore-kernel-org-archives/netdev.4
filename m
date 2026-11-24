Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540841;
	b=s6Nwebtmi6rk5ZlGalBlmImnVQlMtsmUIh3Sv4mAV6scX8oL/X7Rk530PPK9iVLhQi21
	 dysUQXwCEDF3peIeUkgmJLnmoygcr9AuXEpdF5BM0FPMqrzXONQP/oxKkWdcqmLX5bDo1
	 U1ShW/bJ9IjbEqOq9SZCUcTBZ9q+sJ7GFlqQ1XOF5HuzPXII+cwCBBWbvbJE9E980LF8A
	 09/P5YfNE29+igVILnTbvHKSb20iguNyWHtovsrEy9JNIHsRmtx68myPRtMiBBqR+Zdhr
	 qBrdc7II4YQm4CQibUqBo+nVmj9VvkBctl8LH8uUL+Z0rSpPi+3jgCa1G4VlQ6S9qqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540841;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/OQQQduCopXVIDGmi2trA2UVwG7vGp1csUVpwdmh0dg=;
	b=PJ+3t9EOXsSoJHfsbbzWITJZGxNS3DMpgu+H7FE1Dg1CSPLqUGFYfxNVe0vtFKy0otsn
	 EWlapEb3F1xXecY1MAlGYNnd3OMslHu7VD5pjnz1xEhEODxpyyauTvbe7zTY81nrRxAXl
	 5owKHpFpj4YSDBAvyZCzYMmkCeTUPKVSL8+s3UKsFm/+k8gh5Gku11SVlr7oE+h+chT2G
	 zwpULqXG2NzhN9t5nf90zZLPGwBcar9IJJbuRTiX43NHcytMH84JcUVlWn64f9/MJbyLB
	 VmTQPmFyFQm28o9HYW04tlfl6N98PxtvwbyxcpOAIA9iq1P+rp0YIZI/T54flzKuNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Hgx4/M8s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FB606A684
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hgx4/M8s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2061F000F0;
	Tue, 24 Nov 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540840;
	bh=/OQQQduCopXVIDGmi2trA2UVwG7vGp1csUVpwdmh0dg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hgx4/M8svojd2sq/v2XH0KHRjBIJSp2H+4xtuTcejvr0YEpkwEJcd78+ATG+mxO+Y
	 7zL4HvoLUhLaUk70StCPiDjS52phYH1qrnwm2Jf+eznWyiRo/bG1eucEgjPRYS2FQe
	 4u1vEln9AysRORseuiFWk1Woxjn2d8LeRF6IQPev5dIaFu4TbGxE0ZFLJdIyGZGwjc
	 CFLdFt+/sjCXdB5lQMRtyxfyrrvJ2nkXruSFyVdr87hzE0OypBaI4nC/DK2bcOucKB
	 AXFdyslsO8kRDMgFFyeLJX4FppIB/Cr7d/BvNYUoEIgA+lIUmIeWiGGy7Q1SzZEDYm
	 YgqrrOPkPBiJw==
Subject: Re: [PATCH net-next 06/15] batman-adv: tt: refresh local entry in
 single flags_lock section
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:40 +0000
Message-ID: <179554084001.3135.10319614345027013330@kernel.org>
In-Reply-To: <20261123171827.3294525-7-sw@simonwunderlich.de>
References: <20261123171827.3294525-7-sw@simonwunderlich.de>
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

- [Low] The commit message of "batman-adv: tt: refresh local entry in
  single flags_lock section" tells reviewers and backporters less than…

--

batman-adv: tt: refresh local entry in single flags_lock section

This commit merges batadv_tt_local_add_existing() and
batadv_tt_local_update_flags() into batadv_tt_local_refresh(). Clearing
PENDING/ROAM, updating the dynamic flags and queueing the ADD event now all
happen in one flags_lock section. A new announce parameter requests the
initial ADD for a new entry.

Closes: https://sashiko.dev/#/bug/linux-7602d89e-b2cd-43ca-8aca-c165e5d674b2

> This is a preparation for the validation of the entry under the hash bucket
> list_lock, which then only needs to cover a single region.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-7602d89e-b2cd-43ca-8aca-c165e5d674b2

[Severity: Low]
The Reported-by: and Closes: tags suggest this is a bug fix. The message
calls it a preparation patch, though, and there is no Fixes: tag. Could the
message describe the race being fixed and what users see as a result?

Before this patch, batadv_tt_local_add() cleared PENDING in the flags_lock
section of batadv_tt_local_add_existing(). It then queued the ADD with
batadv_tt_local_event(), which reads the flags again after the lock has
been dropped:

    flags = batadv_tt_flags_get(common) | event_flags;
    __batadv_tt_local_event(bat_priv, common, flags);

That leaves a window like this:

CPU1                                   CPU2
batadv_tt_local_add()
  batadv_tt_local_add_existing()
    clear BATADV_TT_CLIENT_PENDING
                                       batadv_tt_local_remove()
                                         batadv_tt_local_set_pending()
                                           set PENDING, queue DEL
  batadv_tt_local_event()
    __batadv_tt_local_event()
      entry->change.flags = flags;

The late ADD is merged into the queued DEL, and its flags replace the DEL's
flags. The local entry still has PENDING set, so it is purged at the next
commit. The mesh is told ADD while the local table drops the client. The
CRC then no longer matches and a full table resync follows.

batadv_tt_local_refresh() now queues the event under the same flags_lock
that modifies the flags, which closes this window.

Could the commit message state this consequence and add a Fixes: tag? The
flag-update helpers being replaced seem to come from ec6edeb755ece6 and
d72e16b1c5d527.

Is this patch enough on its own to resolve the Closes: report? Or is the
later "batman-adv: tt: don't queue local events for unhashed entries" patch
also needed? Saying so in the message would help with backporting.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
