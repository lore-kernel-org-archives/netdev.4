Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072985;
	b=UV8uwN/OrP0sFdBZKfCRB5S5vbeGHwcremppZX/MFhNPYdY2pJPCPWCU7tD/Er7zKCIK
	 Sy/5c3a9V7m6gUOFhnOaWVHyA7+T1DVYEpJq80uN5MFRpxtfylnrr4cc9R6uSKrni+sXg
	 2+ZpfV9jCD83IFl0UHzWa88+X6MKusWJqOEXtP6ZWg7AtCcqjNO7FJ3l1LhtXlrLpiD2W
	 8bDZRF0xYHDUPFrhEX5mdVUD17NCTdWivd/qq8iu5TJPk1Tt44kcRq1PXKfebhQ3Lj6qg
	 oITai63Vo5JT6SNsXCBq5hs+xToPpbhb8FwbmX15dylvgGz2EvX6socic5DymQPoiaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072985;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FY0bM6rMJRNlv/rmOvosKosENUh1Se46gZI10r3xmxU=;
	b=IdFmy6eoY9YxqUV75mSSnBkQoI145IYBpg7DId6qQRCpWb5t7ybzGC3LrvcXc8Zx/hhr
	 AbNaRlGDMc8MltY+yURnuRhavB0U/Wb1POyLJUIGzkJJ+0o9k7KRO4GNMn8dTQMvReUw4
	 tOEYihMjOZqkO9xyNpbrShbvJOhNSa1wbEoGiqRg3qhETgMLdkQYUwUIskp3r4t3gjer+
	 e5UWorZnL3B12NYBEr+r5zfuQFygZ79xx+Hy1yEop8sRsKSpylw1Si94aZVC5ZC6JV5O3
	 zGkc4c+qDJszaviyPc+fl9u6yyBGp69cn+8fBM4dni0JJ3VxuD7l7ERpBpJ5ZhCLxsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1Ljg4xU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C47606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1Ljg4xU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E2B1F000C4;
	Thu, 19 Nov 2026 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795072984;
	bh=FY0bM6rMJRNlv/rmOvosKosENUh1Se46gZI10r3xmxU=;
	h=From:To:Cc:Subject:Date;
	b=B1Ljg4xUX/HK7nOCuMNu/kHeQ6b63SUmtytxpSIC7AHUK7RHkzREfRhzzjafjGki3
	 02X5LgvqsT0pTCMnDtWOU0YWAr12EsPzwGHh3MUI0sE2il69uDYJbABeNoONEY7QJS
	 NDifPj4adTnjHRyFrgLKdhCW+AhjtR4mlwAlobVTTet4xZbUS6Y92H2yNl/KNGA9Jj
	 v5Wo9zGDhaCoKiugFzoL8Lv4+fdIX5IGQtaUD8Y2gU9s7MvAkYCBQUZh1HYH1DAuJT
	 9oGcbz8D+TQilyAtB4SkTgD0cgkZwaa0KeiHiH7WviM7HQIt3dZK2x9pA4Fh8HX0sw
	 0qguvRLIjJF7g==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 0/4] tap: do not hold RTNL in open(), release() and queue ioctls
Date: Thu, 19 Nov 2026 08:22:54 +0100
Message-ID: <20261119072258.3157902-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Opening or closing a macvtap/ipvtap char device acquires RTNL, as do
the TUNSETQUEUE and TUNGETIFF ioctls, although they only manipulate
the list of queues attached to the device, which is private to tap.
Hosts starting and stopping many virtual machines thus add contention
on RTNL for no good reason.

This series protects the queue list with a per-device mutex, and
stops taking RTNL in these four paths.

Patch 1 makes sure tap_del_queues() is called for every unregistered
device, and that no queue can be attached afterwards. Both properties
are currently provided by RTNL being held in tap_open().

Patch 2 adds tap->lock and takes it wherever the queue list is used,
still under RTNL.

Patch 3 removes RTNL from open(), release(), TUNSETQUEUE and TUNGETIFF.

Patch 4 removes a device reference that is not needed by the ioctls
still running under RTNL.

TUNSETOFFLOAD, SIOCGIFHWADDR and SIOCSIFHWADDR still take RTNL, since
they call into the core stack. The datapath is unchanged.

Testing: selftests net/tap and net/ipvtap_test.sh pass. A test program
(not part of this series) checking the queue limit, attach/detach,
txqueuelen change, rename, netns move and device or lower device
removal with open queues gives the same results before and after the
series. The same program was used to run open/ioctl/read/write/close
loops against concurrent link add/del/rename/netns moves for macvtap
and ipvtap, on a kernel with lockdep, PROVE_RCU and KASAN enabled,
without any splat. No test was done with vhost-net or real VM.

Eric Dumazet (4):
  tap: detach queues from the NETDEV_UNREGISTER notifier
  tap: add a mutex to protect queue management
  tap: do not hold RTNL in open(), release() and queue ioctls
  tap: remove tap_get_tap_dev() and tap_put_tap_dev()

 drivers/net/ipvlan/ipvtap.c |  23 ++++--
 drivers/net/macvlan.c       |   3 +-
 drivers/net/macvtap.c       |  24 ++++--
 drivers/net/tap.c           | 184 ++++++++++++++++++++++++++------------------
 include/linux/if_macvlan.h  |   2 +
 include/linux/if_tap.h      |  12 +++
 net/core/dev.c              |   1 +
 7 files changed, 161 insertions(+), 88 deletions(-)


base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
-- 
2.53.0

