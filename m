Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794977516;
	b=BtddoH9d6ijIljMyXqjdGWd2ngYSWRFdSIrklyTKt+mvr04HZw1n9Kbo2711WW/35sQz
	 dAiWS939HUx5fQAttn9kYa2i63RCsU8tUnDjxZtso3NhF1Fh8/HBsWFoKV1zF3BCrakYA
	 JSuQUSI6PafDgObZTY9Eh5psCXXJX5wbvt6QvjCLtwYLZCcF6u1mBjUs1qvCQELGn1veh
	 vzYBFTq267Ug4ealjQPno3jqKvpZYTEdXLjvuT9LQ4li0MgkgCX6rUyYnfBJ2Cbvfykgq
	 BBduKJBryZKQOc0nC9LlCkzfF8lZLydC6SuwsDumhD/8djDK8dYVUTie4kyh5qj+cMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977516;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zKnXRqX2v+aT3gYlNIv7K2osO8pX6mgOgfzS7UFgtqc=;
	b=n8Ei0BWsR7UZanQ9FW4eibp8hfVHdl8wBxrvlnr9x5NcfBqoWjdeRqvPDix4bfcupAEP
	 98PYnAsrUS6edhHzoZSJJx3mR8AiZ4MSCAu3puczrIanTLllM2lzEilgWC24EXqDFsjyQ
	 ERwzU33gQKlFJLrlSBiKp/vkR/QDRBds2P6ueD2chb1sUeKrcpYRM09zt5X9BdeegjncV
	 EuCWZe82SPZyDwVnZ3GMkFF4mgI5+/YVqAKpy9Yy53x72OTmFjgXFX3ByjlcQFFWdIoF4
	 k3AYpMEt6QK6G7IYANG2G8SUZE/rN+aJCUy2BCvC0jZTg3K0EETIOU3JZavMWxUx79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuLZ5nSZ;
	arc=none smtp.remote-ip=91.218.175.36
Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1A606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB1A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuLZ5nSZ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5mvBnQTVoVHqhHsi3OfdVHP7eNZFTOT0ltruB/HvWm8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794977513; v=1; x=1795582313;
 b=fuLZ5nSZFMJVVN+PLvCjAN/lSG7vK6WXGu9NW8aTIyTwA0Z9SzfVxr5YXXfNxgU/c2hnB2ZU
 WESNvtOAFFRAlfXYkPsiVvn1TRoH0eBa+z0afaEDChozcP9W/ZcByOyzBPC0eQHcroUA7TKon+B
 Uw1bcSf5cQRrTHl9uQ/JTEp8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2317ad5862a2ec7;
	Wed, 18 Nov 2026 04:51:53 +0000
X-Mizu-Trace-ID: e2317ad5862a2ec7
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-s390@vger.kernel.org
Subject: [PATCH net-next v2 0/5] net: annotate data-races around sysctl knobs
Date: Wed, 18 Nov 2026 12:51:15 +0800
Message-ID: <20261118045137.174026-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

This series annotates data races around a few sysctl knobs under net/.
They are read without any lock while their handlers update them with
WRITE_ONCE(), so add READ_ONCE() to the readers, and WRITE_ONCE() to the
handlers and netlink paths that store to the same fields with plain
writes.

There are no Fixes tags. Done one knob per patch this would be well over
a hundred commits, so I grouped them by subsystem and feature instead to
keep the review manageable. If maintainers prefer, I can split it up
further with a Fixes tag on each one, as several smaller series.

No functional change.

v2:
 - only resend the patches that got a Reviewed-by or Acked-by, with the
   tags picked up; they are unchanged
 - netfilter patches are moved to a separate series for nf-next (Simon)
 - calipso is sent separately as a fix
 - the other patches had no review yet and are left out for now
v1: https://lore.kernel.org/netdev/20261109025425.328445-1-jiayuan.chen@linux.dev/

Jiayuan Chen (5):
  inet: frags: annotate data-races around fqdir->timeout and
    fqdir->max_dist
  ipv6: annotate data-races around icmpv6 reply sysctls
  mptcp: annotate data-races around pernet sysctls
  rds: annotate data-races around core rds sysctls
  net/smc: annotate data-races around smc sysctls

 include/net/ipv6.h       |  2 +-
 net/ipv4/inet_fragment.c |  2 +-
 net/ipv4/ip_fragment.c   |  6 +++---
 net/ipv6/icmp.c          | 10 +++++-----
 net/mptcp/ctrl.c         | 18 +++++++++---------
 net/rds/recv.c           |  2 +-
 net/rds/send.c           |  8 ++++----
 net/rds/threads.c        |  4 ++--
 net/smc/af_smc.c         |  8 ++++----
 net/smc/smc_clc.c        |  8 ++++----
 net/smc/smc_core.c       |  2 +-
 net/smc/smc_tx.c         |  2 +-
 12 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.43.0

