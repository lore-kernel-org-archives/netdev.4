Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218863;
	b=xw78X/3qvPZ4ShHb/zuCII8miMhrEcFI+hSIx+TikJo8rGp/+N5x/aykyrMaoO9DT3tb
	 wBXgmCdKrMtbog6TvE5CDFsFPmbZYsIHHrrMDCKKOgp8VGJ/ZooLcCrITIQgAfEzL5aUC
	 wrFMO/VB/7DGTG0rbIx8MT/QFYNQCpBud6dM3+UFqu6kL6KvP8rlSkyH/TnMLanUh+R98
	 q0VS2XxOKYXniJuDoaf7oxoTYFNB1Su/erE0yEHjRohY1vDvTf8GMsCCckDKSh3TCAjb4
	 hRLiR4PWd33tQ8LNSuOOwZ5prkSWHG0Ph7hS1gHVgXGb+HIORXJzN6py/JisE9t2Izg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
	b=1EVb+WOzQjkBUhOB1ET1ax8PetNO52vpNif2qP3cbVfKkq1tUqETz19oEOEEpN78Zo/u
	 /8ZtcOahhdZxI2y711nYaziL6EC4eINYvx2cc0b06a1VcfQOgqHRM2soW8p7inCraPsQS
	 8lAWWIZxyRFLR9glRKM424d2mmSHCikZMoyQr8AwnHhPu4XztDnYNbjIMVmh8bziRdjW1
	 3oARQVOCnQK281BdW8UuHUSCbHYrQHsLLXGf7He8Zz8a/5woVf/91OqSJkP5foZUt0xrR
	 FlqxfLHFEJCFo40poEitHb4aIy1YkuOJBRaj7G8lWFiPNmES41zVkO02JFzaqwBgRUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKhq0UOe;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63B606A6A5
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F63B606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKhq0UOe
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13126385e9.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218857; x=1795823657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
        b=qKhq0UOe0Qr2kxLEutjuUqpHAhrmC9Dqv3mB07Hf00AC98Ax8lIaMxr8zNBLDU/E4E
         mXzB8JthOrW9YmCtE0y2jdUaIPsWArhdL55i7ckNMG1WjkNiz7MHODhxNBZ8Ng7VcnGC
         RbqzhhCCqfPTbus9VFMiXzypMmdB63oB8vU1xvcnAn0zqSfwMEdduF+QjijZjJkCdjkK
         Yr911Tnget0k2LKUwmPIIdmoye6tRpRX4a3K66A4mE3u2Yk1xWn1CEciU41lgfLwXOeJ
         bOh5IkQgQYugP19L0ZkLSEPQN/DJMP82NhzswkfKB7+/fbGzigN2Sx7B9kuowQe7wT2r
         149A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218857; x=1795823657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DqEQVPhr6GusklbRo0OOnhzJ3BLe/1hpOgbosdDgc0=;
        b=NgjtCMyro/3i4XjnKuc/c4iwxIfp6VU2yjZY7TOcIzOSsCFzZnxg9nDeRpqHMGgdde
         VH6bdStbQ81XUugRvamJQqbtsg1uNsHTMkwWzQXR/KIIzI9mLW759g01VTVYLtvP9K7J
         qmKyk23l534XHE9NKlVObmltu8XGTSLT3Nn/hrdMnyKhTwjdPb6l8wR72SBEUFlZ3Mh1
         P7cTAqc8y5pU9eenRymLIoinB3tUE5Rg/b62h4Run/+WKwhC7l0DtF7qNiWaXBp2D662
         rh5sWACHDmbeaRyGy9ul0Gat8S9AUfiKnjyuZ4/2yx04qEFchZsMRAB5dJHM7L4A2Hu1
         AVWw==
X-Forwarded-Encrypted: i=1; AL+hErEF9JQllJF9Cy0515ZRh4ObplrUVV5VfrptjyjIk9MFx3aUcCfMHg5T8AjuDLcTJhfjYNC/aTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X4NfbedmYdCKCgjzE14iGF0j+ZS1eaOMXX2aKCc41EJH1mbQm
	J6Tp7WU79RyeuEAEYxpTrL/XLqucbNvY1QruWkV3GzGXsf0OPaBQADA=
X-Gm-Gg: AYBFou3CgzTeYHr835dkjrlvjgVgz+YJ2D/u1/f8skWrTkQdNkxiWZks0DDaM2i9ppN
	PXSFXR92F/zCUSwwO1hQet6mWKP4p3AtrHaHU1JJrUfAwOd0LQFrUrhJtsQbWka9rR7IWqum3fp
	R+7Ts3ZlMlyBJptvnTYeBDnfWtf6i2OmW1Brf98RndoS7J6fCHMU9UbB5HAPruB08e35sxq2vrC
	ihq5qxt2vio8vEnbE4LbGU4zEO8yGGEDbRgebLzAgPuAN0/XmO1UJdwqPzT1dEyEo6pSNBJq447
	vWq4jGXw3q2Rr0sx45Pe7FXzO5q//rssWA1AUdmTLUxE30Vab5WE5Q7nY0C7OcUYAb1QFzr/lBs
	iDk/WOU/EyzInnkuTGP7ksMXY3x/1xlDQI+5pqGz6940t1MaWeghsUcXyQQ4b5gVk5YEXKtr/i2
	snax6n+8L6T5k7gSIX3C0PHXKI8z5O8bfcp8ReBnPNqNU6BLYWRGyXjT/vY0sRD+1IVgSw2s7E3
	/52hVHa5MtBlmH53SSnekO7KbRFdSxWEspeiHBWMXFxPaOjoyCPg7YVftIPdOPg+DUQsn7+d3Gj
	YMNLMSS5NKBT1DU=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr115640335e9.6.1795218856735;
        Fri, 20 Nov 2026 15:54:16 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm29426445e9.2.2026.11.20.15.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:54:16 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	Paul Fertser <fercerpav@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net 0/2] net/ncsi: fix RCU list entry lifetime on package and channel removal
Date: Fri, 20 Nov 2026 23:54:05 +0000
Message-ID: <20261120235407.1911365-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

The NCSI package/channel/device removal paths call list_del_rcu()
followed by immediate kfree().  This races with concurrent readers
(primarily the unprivileged NCSI_CMD_PKG_INFO netlink handler) that
walk the same lists with list_for_each_entry_rcu() but never enter
an RCU read-side critical section.

Patch 1 adds the missing rcu_read_lock()/rcu_read_unlock() to the
reader paths so kfree_rcu() on the write side has matching readers
to wait for.

Patch 2 defers the free side: channels use call_rcu() with a
callback that also frees filter sub-allocations, packages and the
device structure use kfree_rcu_mightsleep(), and the work is
quiesced before packages are removed.

Pre-existing issues noted by sashiko-bot review -- dangling
active_channel/hot_channel/preferred_channel pointers, unquiesced
per-request timers, and the ftgmac100 unregister ordering -- are not
addressed here.  They affect the overall NCSI teardown design and
are better handled in a dedicated series.

Tristan Madani (2):
  net/ncsi: add missing rcu_read_lock to netlink and device list walks
  net/ncsi: defer free of removed list entries to an RCU grace period

 net/ncsi/internal.h     |  1 +
 net/ncsi/ncsi-manage.c  | 39 ++++++++++++++++++++++++---------------
 net/ncsi/ncsi-netlink.c | 32 +++++++++++++++++++++-----------
 3 files changed, 46 insertions(+), 26 deletions(-)

---

Changes in v2:
- Rework as a 2-patch series fixing both reader and writer sides
  instead of a single patch that only fixed the writer side
- Add rcu_read_lock() on the reader side: ncsi_find_dev(),
  ncsi_write_package_info(), ncsi_pkg_info_all_nl() (sashiko-bot)
- Defer channel sub-allocation frees (mac_filter.addrs,
  vlan_filter.vids) to the RCU callback so readers cannot follow
  stale pointers during the grace period (sashiko-bot)
- Move disable_work_sync() before package removal in
  ncsi_unregister_dev() so the work function is quiesced before
  any structures are freed (sashiko-bot)
- Fix Fixes: tag hash from 2d283bdd5b20 to 2d283bdd079c
  ("net/ncsi: Resource management") (sashiko-bot)
- Include discovery method per sashiko-bot request

-- 
2.47.3
