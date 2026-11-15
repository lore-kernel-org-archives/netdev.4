Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759441;
	b=ahcwkk7y7ixgplUnSbf5c+Tah0Pmil3KkJn8/FZ0bdetFbizJkga5bD4E1MeRe2eOve2
	 pDHKO47ikorOzPT4NSeHbnC0FCCRmcrTTA9r/FVZTT//CfDYZv1pqaxRMDsBuRfA9VJVl
	 tQ9wpsXgLK/4oVhoC1m5nKem2MkgBKJ9gLQpNK3kmUKJlENR6URCLfW8oPrRBXQlL/mvE
	 YwtKe9E3EDQW4wge0yR1QtHJ1nN/hIXxOzrQ1plyxm5NJAElhsIhJMp26zr8mElGGAy9k
	 qu5Zz1Sx1VDsc7jGz05vA34CQQbErIlOKEaio7p00HPR8GiQTNxt1cSs2ftmFJPjZjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
	b=yMc1JKllQDAh2LhaKyMj5NvW3U1Wx37POMUYu1TerxP6CZ/PBKWa5tOORR+XMA67elHo
	 sNGTtSndX08CGbuoyTcvWofjnj9tyoXswi6aDk0TnmvJ6eVVQ+heuH+cmirM8SIsrEK3J
	 +YC+kYFAS1ZPcXCDnJ51BcODAtx6jMqJwzeSNrJHPvNB628Ot8M5yYnuYgCLyoY9DWf0m
	 vG9+DiC8v6E0mbkqKfrYJQXIw83aeO6rBFb4TyV6P0aBhhi8B1aygVtEZLz3YlFFtGTJA
	 QZQZjjIoXkUvM6VnndE36RaRrsTDicP/upMNpHodrpLR4NGA8pOckOqj7l6BZMdM0Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2rJaiQ5;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9719606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9719606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2rJaiQ5
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so3553036a12.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794759439; x=1795364239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
        b=R2rJaiQ5HqWalGyhLP6BMT2OUXd2xSj7dwmo3raaDreSDVlsh0SXIqrJvIz7Umj1ke
         iqXhOtvHFOlwItAGVn7ePPpyXoVPUG1UvvHNP/flsEHZKgJG7TOAt16YHnR8VosReTof
         i5pQ8UELMRn2LySK6mJkLCUZFFZ/ZVW6J+zyNd+CxEd8I8OPS7rBRi2Lp90oFBimDoJh
         q0hzdml2jg1San9mUlzZ2uHV9hLtF2tC+elpQyFBm7MEYdKuxmm4CsheWxvzBKS9h8lv
         fhT/E86cAWJkTw3yexjtEZIibs29IZT+3wl5NRPagNRV0NZEFXbfXSzVFmvEduBbwOwd
         z7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794759439; x=1795364239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/z14z+d7POgY9c+yc0G66ZMePGWOZhS5NXoDt9IfGc=;
        b=SY+STMvJweqmUUCaUKAfPibm2oluepuZ0uvZATpiQGJYI22mgLEpzYL/AoMUmr5PbE
         KDkXA6Bf9eYoq3TBIQiNX1OvTziuyF5SXFcGS8C3gMfbYJ68uStRjtE/acNXSmTg1Y1X
         V12lxz740gpr3sU/I5e2pd51w05cNMXYnGqu3wVhWz6hULZyiVmw5kg6NyUuM7+S9DjS
         V0vu9VsDdaXsMN9H/H/jdKOXeFxdTjPjNjjtcD2D+VpGxOJDhHARAB6qVuTTXPROukpH
         ez2G8d3poQ6GjUHQqz4avhB3BoSYklWzdSO6/yXgtwZpL5QeZqCCl2p8FmPjVIy7HqL8
         +/jQ==
X-Gm-Message-State: APuU4Z99LBtozLj6ZASwIokkBTFViA8oty3oLHhsaHnKDqnRr1EKPQ50
	8dcCSMH3kjyHBzyScEaBqO1F1qorj4PnnGbWq2dxZOjwtJzx1M5XRvPB
X-Gm-Gg: AYBFou30Q2NYY2FEh7ZoD7V/hgaUJ8AUUQD1LcgFhpA7yONPecr2P4yhe/Fut9VgS96
	PdlSds0518i6cu/bS3RURG4k+NrYgY2Hy/0bN/vehvgIWwRPX/iUtY3HqQoaXmE5q2mRDgCi0zv
	5VGlGjqGIZIxgDBaxv6TacmR16HApU5j0w5TFPI58qSU8QLRpqDDU3icDVjiyE0OxNhTWmQrnlR
	gx/jWyXFE5xed6A14mPCcJPMq510yAWy/B8Avix4eL/TF3FwRA4DuRPG+mHxPU+h9f2Z6UQK1J+
	x/ourpCARSqv6UHunHzhlb/rh3zLNKbPDqgAY/paaFJle00K42oO7lV3MjfW3awVVCAGJlB3G1B
	nF6opon49BXLyaSrceKhy8yqRVCgizcx5442+aiYNd1XVzB1M4JYDWJfJ1sN1B1jys/3fQyYeqD
	lB7bhWdgNnwSMhtaIWRgfDVe/wOm8eszffxSaYtGeWUpA+qsG6My1Ec09Qc9agZ3+iL1iSbkv1F
	n/F76WVSIzzlN5PRlLJV6HKwlWfllcPn56OVPvdMZYQfw0KMjuKmAHzUuFe3PfpL6etLxKWk6bF
	qHOmp/eO3//6EnTvNyp6IokPJyO7xxJygEt1mrKoLS8OQYGVkHF7H9EBj92ZEA8bXkssNZQV/lJ
	uXuiBWoOzuZYLDBGmSZcw4Zal19dP31CfckgJzxwwh5GYQM5PhwgsADEtD/oI+qR3kGQteglNtC
	xU7+rejrQ3Zsxx1z6zDiW4JQ==
X-Received: by 2002:a17:907:1c85:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c50963bbc82mr656270766b.43.1794759439146;
        Sun, 15 Nov 2026 08:17:19 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b57c5bsm319832666b.49.2026.11.15.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:17:18 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: netdev@vger.kernel.org,
	netdev-bot+sashiko@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware bridges
Date: Sun, 15 Nov 2026 17:17:01 +0100
Message-ID: <20261115161701.2351256-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179432406157.994134.6897059294926012210@kernel.org>
References: <179432406157.994134.6897059294926012210@kernel.org>
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

On Tue, 10 Nov 2026 15:21:01 +0000 netdev-bot+sashiko@kernel.org wrote:
> - [High] In VLAN-unaware bridges, rtl8365mb_port_commit_pvid() now sets
>   pvid = 0 (VLANMC index 0, EVID 0).

Jakub, as you asked for a reply: the review is correct. Multicast
entries have no EFID, so with all VLAN-unaware bridges and standalone
ports classified to VID 0 and VID 0 in IVL, they share one {MAC, VID 0}
entry. v3 will not do that.

Luiz, this ties in with your mail. One correction first: the patch
does not move ports without a PVID to the bridge PVID, it does the
reverse, it keeps the neutral PVID on the ports of a VLAN-unaware
bridge. Your main point stands though, and I tested the SVL direction
on hardware.

The switch has a port-based FID (enable mask at 0x07ac, one FID per
port from 0x07ad). I tried it on an RTL8367S and on an RTL8367S-VB, the
latter with the L2 entry layout from Mieczyslaw's v10:

 - The port-based FID alone changes nothing while the VLAN4k entry of
   the VLAN a frame is classified to has IVL set. The learned key
   stays {MAC, VID}.

 - With that VLAN4k entry in SVL, the learned key is {MAC, FID}, and
   the FID is the one of the ingress port, not the one in the VLAN4k
   entry.

 - A static unicast entry written as SVL with the port's FID replaces
   the learned one in place. The roaming case from the commit message
   passes, 10 of 10 pings, on both chips.

 - Multicast entries follow the port's FID as well. With an SVL entry
   whose only member is an unused port, 0 of about 40 frames reached
   the CPU while the ingress port had the entry's FID, and 38 (39 on
   the VB) once I gave the port another FID.

 - Two VLAN-unaware bridges on the RTL8367S, each with its own FID: the
   same MAC and the same group in both give separate entries, deleting
   the group in one bridge leaves the other's entry alone, and traffic
   of one bridge does not hit the entry of the other.

 - Tagged frames, on both chips: with the VLAN4k entry of VLAN 20 in
   SVL, a station sending in VLAN 20 is learned as {MAC, port FID} and
   the roaming case passes, 10 of 10. With the entry in IVL as today it
   fails, 0 of 10.

So for v3 I would drop patch 1, leave VLAN 0 in SVL, and:

 - give each VLAN-unaware bridge its own FID and enable it on the
   ports of the bridge while they do not filter,
 - keep the neutral PVID on those ports, as patch 2 does now, so that
   untagged frames are classified to a VLAN in SVL,
 - write the VID 0 FDB and MDB entries from DSA as SVL with the FID of
   the bridge,
 - as a separate patch, write a VLAN4k entry as IVL only while one of
   its member ports filters, and as SVL otherwise, so that tagged
   frames in a VLAN-unaware bridge are looked up by MAC as well.

VID 0 is then no longer part of any lookup key, and multicast is
separated per bridge by the FID. vlan_filtering_is_global is not
needed. What remains is a VLAN that a filtering and a non-filtering
bridge on the same switch both use: it stays in IVL.

The FID is 4 bits on the RTL8367S and 2 bits on the VB, which limits
the number of such bridges.

Does this direction work for you? As this is no longer a small fix, I
will send v3 for net-next, keeping the Fixes tag, unless you prefer it
in net.

pw-bot: cr

Stijn
