Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760308;
	b=2kQo/G/vKaRZEUdxXm3sISglyoym9aDYkcUj3F3bZ5u25tP0FprDZP3BVd/cGpOlXVqM
	 Q4zQqLBn3ddmKpUIUNVeYXOnQFTmlJ/VfnhwK7OkDf4/A1DskeXLg7S+a5OU5D42ZtPk+
	 XgjHkicN/gsnsH3kxvcp5jab7W1ZW89reYQWgUgvKHcenRqbAN06SzPU5maXTRntXPBpn
	 xNmltfva1Hk2LaJ8BEabS5GjL2juNlPe7MZrDlt55WwJ+BZBBP1i3TR0XO/3oDMbjJzpa
	 VyzTUTCBeSRWUHfiGXzWG7tONe4UfCaUepneTFTAAlhHCa2EL8V64V/OAMZQ86+v75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
	b=sxMuWfMw1gcOV1qe/L3SzfS7JrdXHFNY2YEyXcm9T2JvvLQPva0B1XZMHZ39D7vboYs8
	 7G9Wo/z4eul856Hfry9x/pbnOJInoSNwJTPfOiImOPRXPTZnTfWQ6AucSEJ0Eqw2oRdOu
	 grX6L/027R8Bonsirk+FZxRK3Hpf1FVtQXDfQ+5ifiKEpAhcPvViO30gOgsclWJcEJzWD
	 Z+7hPr+XrniVuo9su4R+tkABC2KcLnLCXhxRFNowGbgSPz/NEUAyPv3Py9e6smLOBnjsC
	 HWAvm03SjE3plK2xRn+HtSOYS6vy+NwXrJDw/v5RnZEqr6FyZmcZhlE8SfuYMYb5cCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga1zOAMM;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811AC606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga1zOAMM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so7906418eec.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760308; x=1795365108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
        b=Ga1zOAMMdUTmf0/e02gbatFJedn9Tn99lSwN35reaqR3Wv/so/P7ZbnKbuZX4EYc+F
         MpSNn/53eoLG0pNp6dNz+/P0E3wZazfzA1BeRAAHG23oPjKTTZ3PJESXXwUfyz5qsgz9
         lychR2he8YJjK81weoGfeXaN9FRmQzH/2g7A23rS63lIDSo10MX+j3m7P/1K1cWRZLoO
         plnitRqyMp43QRIlEjIL39Ibh0rApU3s4txg506JcHWkP4qSm0bQ86q8VoLqJWQAF111
         WqWViLqPWaui5sBNt/bqbiR1lURBA9kQ31ZQJ81MwVPRjcJ2CmghA53yFgMMfUwcdLqE
         6PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760308; x=1795365108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
        b=2SURrxTFp05TZsB3qpJh1t5Qki1jldxGRMGuAU8jJCPk8OOJLes9ykJhtEg8KYlpHt
         hAISgRWwMsmNcTDQqVhEFPA07+GOJEkgt0vz1XJRu0eeCpNh5gma+sxK7j1zneQzmjB7
         f6Ix7tDEFGWm71OPv8IrYZO5M7YlcWZ1tTOblleHHnHBUnNRW7Lsr9+0hALifIcRKCvP
         zgTE1EHhIQjB+qKtcKdSVJZVMJsGmJ5KVRG3KN+iS1SNE0U4bzqcSMrT9/EbYLaTUOBL
         uetP4ml8I3UofK3emc2QIIsqfdUsc/BaSiA0GEBdJhE/xFHPgt1cvsbijWtvaO8NPbgh
         rFJw==
X-Gm-Message-State: APuU4Z/uQOyZg1r9FjmF4VlNz5693zMiFzj08Z6LiBO144szrJx51VDz
	DqJ0dDanL726KqatgVRRHHux5Uu9qNwL3jE0ARTkEyew7GywqcUeIh7jPdM/ife+
X-Gm-Gg: AYBFou2MvCoUm8J39yLulF+DE6sl/YDfNkijgA6wyohG19o1/FCoklT4bhtrIWdbtgw
	ssFdFQzfDw0oH5TttpvmLJtycawtWZHNxGttanOOp0vJWWjkJ1+EHGlckPhFEiCavw+mAPUrbLW
	peoQkGGga2lyMJ5KIvHSj2X2ENmeX2a+Ewtuz4/DXkeYqT61gu2ogqOFsAVbcKS38S6zIBzCaxl
	ieaLnGZDFvxGgwHdDz5y28Ob0Sco8bdukZDGSZjv6UzwsgjS0xKR1NL3hvDPJs9jz0NbVADoKGD
	HIAgnqW328wUb5g2PVHPfoe+cJjlq8ESw57CCdd2vBnOUDa48F7nkcmP3c61vV3ZVFKvvm9AgaX
	cwAdwGSYvB3kgBdB8/PtEqgKHKok4pjt/YkA+ln0NHgQ3r5frzBopkkzBYiie22jV65oZbZo1Dz
	x8bUYEXk1no+yy2VT5cFafPb+tkQ0zlM4ZDbc/qapia+MfGEkLCr6vKUdmmtLmkO8qQ+9m8Atdq
	XrzECU1v1u3kFIBN8MPsKbCvAmV++/2eSdM3rk2qZRRGLs/2pf0owVd4ifDI1RP9EYuFO5UiHcQ
	+WV/hfu7+ADvE4uSrFdIRdOV
X-Received: by 2002:a05:693c:620c:b0:374:e25e:a533 with SMTP id 5a478bee46e88-37967cdd715mr10119668eec.35.1794760307511;
        Sun, 15 Nov 2026 08:31:47 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27775320eec.28.2026.11.15.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:31:46 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sun, 15 Nov 2026 11:31:32 -0500
Message-ID: <20261115163134.3202677-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The datapath records the user features before it applies the change, so
a request that fails leaves it claiming a bit whose reference count was
never taken. The first patch records the features last. The second adds a
selftest that drives the failing request and reads back what the datapath
reports.

v4:
 - Rebased onto current main.
 - The skip message is one printf again. Splitting it made shellcheck
   report SC2182 and dropped a word and the newline from the output.
 - The new tests say why they failed on stdout. info() writes debug.log
   and a failing run deletes that file, so CI showed a FAIL with no reason.
 - A datapath that cannot be read is reported as that instead of as a
   feature mismatch.
 - The outdated add-dp request is checked instead of discarded.
 - The errno numbers come from python rather than from a literal, and a
   lookup that cannot answer says so rather than comparing against an
   empty string.

v3: https://lore.kernel.org/netdev/20261110174651.972936-1-houminxi@gmail.com/
 - Cover the recirc bit as well as the dispatch bit.

v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
 - Name the two paths that leaked a reference and fix both.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/

Neither leak has a test of its own. The reference count behind the bit is
not visible from user space, so the tests read back the features a
datapath reports: the reset drops them to zero where a test can see it,
and a datapath freed after a failed creation leaves no state to check.

One thing this series leaves alone: ovs_add_dp() returns the status of the
last command in its body rather than of the add, so the `|| return 1` that
follows its calls cannot fail. That predates this series and every OVS
test shares it. The two tests here do not depend on it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  34 ++--
 net/openvswitch/datapath.h                    |   5 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 173 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  61 ++++++
 5 files changed, 262 insertions(+), 14 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.1

