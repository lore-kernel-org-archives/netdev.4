Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540842;
	b=edpyjro5DVmzTpg8iaKcpa2Inx5tHmlDLFh7oNHmOnyTO/iONgGFAAR8jbS7jkTc1pPH
	 FHuMPRlvUU20Bk9o4LhUSK5RXbf40MDbaxqbrGeNxt0Dbm4NJlbyuqDUIxnwoYZ0KquaT
	 bz4Pa1P9ClX+pbjfAskQ8kq9F9kUhMmxiytMimMRBbDTZwVBDODwhPsK42hKQYpplObzo
	 +OUrz7Z9r7IMu/DRN3rpTzJKO6HEaKAP14P9zgpeAv6NMwcvwnmn+eIlf90c9M4iz3c9B
	 g3nXs8TezYe5QEoga42AmIFW7TygZQiwWJJCDXxTFo0KR9OiGXkdawbLlJiF9cTFDpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540842;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=c7mEqGUvASdHjf6vj1nlRmarPicG8Hbm9iUcTZzGMik=;
	b=jMghEuOEFctotFH4TQ7gANjcE7vEySgjqYIOqQyX7ltufLONrGRhsX7Ci5Um6i1E7n9G
	 qmgx58VZfPx2CCNJ7lN47Y8SpcCArx6UN02/PdgbpAplLVt/IlADiYlhXm5I/n6fj3+dG
	 hcHwkQl/WEu5np5ymejEhNPXMvR1SEobxNBXqo+xHuFMiTTTaM9UHGLa+8f6Lvlne7/x+
	 jHDV1C4mKE+SXLCpYLDDSJ4JhXrdtJ1Sw0rSwzUtB2HeKrXvXEXU4ayF88NnlQ3XEr7NY
	 p2iO/CtBGWHdfrZtctxwNQBng02U+H/G7MBd2ubjD4zbt5c0qMEqP3Ly4IYb2lU9KYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyAdXER+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADB606A68E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyAdXER+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35051F000D8;
	Tue, 24 Nov 2026 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540842;
	bh=c7mEqGUvASdHjf6vj1nlRmarPicG8Hbm9iUcTZzGMik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eyAdXER+OnIDH22sQVx5NmIPv/VIGVM1zzTsf2RRXXHu2wUFngIUWx0V8Gb2i223u
	 9HBQ0kHsqMJ1BUr95PK7kGwgv3RCqbr4lqFopfZy4e81qwgeCgA59dWl6C0ND7oSva
	 Naeh9s4SopGoACWTMfa7GW8eDZL3X8HPT1dG6UKgGGOdCHxDYHzDVoZnheGG2EQfJH
	 glkGw6zTiHJz6NL31UsholnGz8DHz+I7SBK5mzOCRKJwZI9h+dDYoRMHy01JNVbpCW
	 usIo+AZnDpLVG55F+1gkUGATpHDAP39IY+sqMcGzyLTCfQXCB1T+dWcMBvCPvTa7TS
	 tqKSs66Mk7+Lw==
Subject: Re: [PATCH net-next 07/15] batman-adv: tt: don't remove unhashed
 local entries
From: netdev-bot+sashiko@kernel.org
To: sw@simonwunderlich.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org
Date: Tue, 24 Nov 2026 17:20:41 +0000
Message-ID: <179554084147.3135.8288154830036400852@kernel.org>
In-Reply-To: <20261123171827.3294525-8-sw@simonwunderlich.de>
References: <20261123171827.3294525-8-sw@simonwunderlich.de>
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

- [Low] The commit "batman-adv: tt: don't remove unhashed local entries"
  fixes two real races in the local translation table but has no Fixes:…

--

batman-adv: tt: don't remove unhashed local entries

This patch merges batadv_tt_local_mark_removed() and
batadv_tt_local_remove_now() into batadv_tt_local_remove_entry(). The
hashed check, the BATADV_TT_CLIENT_NEW check and the unhash now all run
under the bucket list_lock and the flags_lock of the entry. This closes a
race with batadv_tt_local_purge_pending_clients() and a second race with
batadv_tt_local_transition_new().

> batadv_tt_local_remove() looks up the local entry via RCU only.
> batadv_tt_local_purge_pending_clients() can unhash it before
> batadv_tt_local_mark_removed() acquired the hash bucket list_lock. The DEL
> is then queued for a client which is no longer part of the local table (and
> its CRC). And it might replace the queued ADD of a new entry which was
> added for the same client in the meantime.

[ ... ]

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-c3e34735-5286-4ed0-9338-a77e64fef540
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>

[Severity: Low]
This isn't a bug, but should this commit have a Fixes: tag?

The commit message describes two races that already exist in the tree:

  - batadv_tt_local_mark_removed() queues a DEL without checking whether
    batadv_tt_local_purge_pending_clients() has unhashed the entry after
    the RCU lookup in batadv_tt_local_remove().

  - batadv_tt_local_mark_removed() checks BATADV_TT_CLIENT_NEW under the
    bucket list_lock, but batadv_tt_local_remove_now() unhashes the entry
    via batadv_hash_remove() only after that lock has been dropped.

Two earlier fixes to the same functions both carry a Fixes: tag:

  f95b9f28a9df ("batman-adv: tt: queue local DEL event under bucket lock")
  a6746cb19076 ("batman-adv: tt: queue local DEL event before marking
                 entry as pending")

Both of them use:

  Fixes: 976b159b3c12 ("batman-adv: tt: use protected flag modifications")

batadv_tt_local_remove_now(), which this patch removes, was added by
931de98d3960 ("batman-adv: tt: extract immediate purge of a local entry").

The missing hashed check in the first race was already there before
f95b9f28a9df. Its origin may therefore be a different commit than the one
behind the second race.

Without a Fixes: tag, backporters and the stable tooling cannot tell which
trees contain the broken logic. If leaving out the tag is intentional for
a net-next submission, as with the other fixes later in this series, please
disregard this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123171827.3294525-2-sw%40simonwunderlich.de
