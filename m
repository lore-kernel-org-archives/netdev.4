Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825410;
	b=MQ+ppuCtZhjYa+CefplTsYXSWkNzZCZQaV3O+cBF/4cm+08wCG8ghebB8pyhnfyHigW8
	 LTwrAaYBD3EUBgQnjt7kf2Eys1Ocd18k2x1m5ezdRzp6lh4dMZYD9GtNhFKHNhayizW2t
	 I2FnOvbIVXFYTDQS42HOEsd71dBNFSNdebYNtoH44tJ2doLQKHGHGsDHZFO/y8Ov8H9qr
	 v7UpkKVUtNmowh8Bun1c3ZPJfBOrrCP1xUKWpv1HthWNK4Vp5Q3kzVsppUmHCOgdfJebl
	 5nX4TJu9aYLeTLFrd0F7+Xm8MHMltBZYi/80ZHwOLAxZQnnm083LNtLMPR5+VBchEGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hrslb7xwY/P3caxQHjfg0Zlzk+SkRY2D0gWn0IfeX6Y=;
	b=IbO0p0hzw5okh5UYZ+1GdX7sBACvlINrJe/JmTXqxtNu/Ak8vjkBQ2QK34w+4sdtPVjB
	 dfsqdIIgCuxwpTF8F+uae93cbqHMxDXXtQ9NTDoQz4G5kI/lSDGDUNH0HgT7Xewuemxvu
	 mHE++hsxkTzv8xJqNAJpP7aeJ5Rranin+SLOF3rnZ0ahfVbph512y6PNUfc03pWlc8p/3
	 xcDdZYxeTM8edE7tleMixXrN3JyooSi/Rtkpja3PnsqziJ+8zzq6zp0uoblEc3UrUjcYB
	 xj5Rhjo6UlGtIFbUAVIwsmuENkwKJHDqGlmIbM9P4TDuOinxxAMdq7CJZfYM2O5lWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="wC/Udj35";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5E606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A5E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=wC/Udj35
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ec2d42231so47982626d6.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794825408; x=1795430208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrslb7xwY/P3caxQHjfg0Zlzk+SkRY2D0gWn0IfeX6Y=;
        b=wC/Udj35b3zAdFfaRatiA+UL2HEs+pGiySYusb1ax5IeScQOsVwYXfLUlInj0Thd/t
         xhPbm/hOkTw5FqqRRkx2tLUIEHZwXpOpR/AbU9dRtbOmUB26AFoe2IZQ37TjnYwZVYOd
         qKQfc/BJtjiC1DzCK+849keYhKb1hCNNSJyn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825408; x=1795430208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrslb7xwY/P3caxQHjfg0Zlzk+SkRY2D0gWn0IfeX6Y=;
        b=xteYB9JklLMfUaLrdynv2Z2NsIkeXg2EjRDjNz+MrPKGNccCgekou67XMO0bGNfpUw
         4zW9oEdNEdDbZZScYLSzXbr2HKxinIWv9U/jpVvi3OQvaKRg6AjZAby7OeUrfFOa5pgK
         c5Pqa3PaHwa+rai5gKfkl7pU5mO9cak7jrPs5g6NlwkQ8ZDJExnOjLHNd1DlitNoeayC
         z7eApmLJKVXdJfjHyzTjGq2cr0GAK69ndU3ipW6UMpkzLVRJZLlBjETzXBs0qo4BEiPS
         fcJMKUOcuIrEx5igKaJz9vYIZK7eyQXmEPlJ1B0cjvPfBWKPAVHZO4t7fHJgyp1PrazZ
         hf6A==
X-Gm-Message-State: APuU4Z9twmXNrHnON6MXkZIXHmk4xl3+x7vsHTs1MbSwFim9KSIpizQn
	4yeAtpzzrIR5T9QgCqwABq28y2WPebBEABlhlIaTaaW/pN4ijq6Cmx5xdN9roQd99MG7BwIogc+
	6Ois=
X-Gm-Gg: AYBFou05z2b24cRLHv5sZ94EK4tBMDYbXq/5SoIflr7VH0b9NS+vWMez/iOM5kBZ+mT
	1/pvz7S2cCcgn7tosNWfxENL1anT+Azhx/eP2B2u+Dx4vP7BaoAuGA06X99FJm7nVUhUH2rYpVT
	nyb0BFlQLLuFErKjyidwTLIG+6K85/8AkWABBlbWXQ5zFqzUJ0BalK+OjqmcV6Oso1bvGyX8ktI
	CQL44PJFTcPAYZho/WSSs9JgzD775x7oF/SYzjqXtBAJpUxNpMFLTjNybHatvvk/mn3OxLRrWC1
	D26rFw4U5R0luXpDVzuW44/ZLyilINSM4/9r3lXB1TCX59/Lzu1T7jhTpCfBCbL0RBzQj8Ng+VL
	OPI4e63w4VVGxVpeb5qnmOeZrDBKhwmuADQvMUSjz6Y/MRZ/LPqvFu5+Vmu9hPQM+K0NDy4ASRG
	Z1uUbZqnuZ+ieO0SLR7Ex/0IbWrvT7Pvfzb72YTABRHn2h3A/jh+BO9HgU3JGwHnHld0nu9liqQ
	795cnFRhum1+fC2/DW59K7CJUdnBZBy7/ofex8tdzJ4zuWGuR4x8I0shWDuszmqA5sjLGtu3NsY
	oATkU8wPfKg5EDbU2/0V9E+74F4+jf6zaSdJj9DiC5hMLMctrZS+ZJAIhaqi7J1UtfdwqXstgFt
	7HyLCMQK86NWW7Vwe8Ez+
X-Received: by 2002:a05:622a:581a:b0:536:5a78:6b13 with SMTP id d75a77b69052e-55ac8880f3amr162945851cf.57.1794825408015;
        Mon, 16 Nov 2026 02:36:48 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad14f1ecasm77778651cf.24.2026.11.16.02.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:36:46 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	bpf@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net v5 0/3] net/sched: sch_teql: keep the transmit path's skb geometry and device lifetime intact
Date: Mon, 16 Nov 2026 05:36:40 -0500
Message-Id: <QDISC-6HS9.v5.r0.20261116052927@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

Three pre-existing defects on the teql transmit path, all around
teql_master_xmit() -> teql_resolve(), plus the core helper they depend on
all derived from sashiko reports.

Patch 1 makes the headroom private before the neighbour can write or queue
the skb, and pulls back only the header that slave added, so a
header-cloned skb is not corrupted and a userspace-supplied link header
survives a retry.

Patch 2 restores skb->dev at the arp-queue reinjection point when the
neighbour's device builds no link header. It is the neighbour half of the
version 3 patch 2, split out on review so it gets its own commit
log and its own Cc set; requested by Jakub.

Patch 3 moves skb->dev = slave ahead of teql_resolve() so a skb parked on a
slave's neighbour arp_queue names the device whose neighbour took it, and
so cannot outlive the master it came from.  With patch 2 in place it is
reinjected through the master and leaves with a link header.  Its commit
log carries the KASAN report the unfixed kernel prints when that queue is
drained.

Patch 3 is a follow-up to commit dc4b95b8fee9 ("net/sched: sch_teql:
restore skb->dev on the slave failure path") by Victor. Patch 1 is the
same commit's sibling on the successful-transmit path.

To prempt the sashikos:
- The pre-existing teql issues reported alongside this series are fixed
separately. For "the lower-qdisc drop use-after-free" see:
https://lore.kernel.org/netdev/QDISC-Y0BY.v2.r0.20261024060625-2@mojatatu.com/

- For the pre-existing consumer nft/bpf complaint see:
https://lore.kernel.org/netdev/CORE-9NOG.v1.r0.20261111073528@mojatatu.com/
Note: nft/bpf combination _has never worked_: it is a producer-side
mismatch on two separate entry points, not a regression of anything here -
hence the net-next target.

Hope the sashikos read these and dont complain again about those issues.

Note also: part of the testing of patch 2 runs for packets that reach
neigh_xmit() from nft's `fwd ... neigh` statement, or from
bpf_redirect_neigh() with explicit nexthop parameters. Both keep the
route's dst attached while replacing skb->dev, so the neighbour that
queues the packet is not the one the dst names.

Changes v4 -> v5:
- patch 1 closes the finding Sashiko (nipa) raised on the v4 posting.  The
  head is unshared before neigh_event_send(), so a skb parked on the
  slave's neighbour arp_queue is already private when that queue is
  drained and the neighbour writes the link header into it.  The retry
  strip fix is unchanged.  Considered comments from Sashiko (nipa).
- patches 2 and 3 are unchanged; this resend is for patch 1.
- patch 2 adds Kuniyuki Iwashima in its Cc set (nipa CI).

Changes v3 -> v4:
- patch 1, no code changes. Reviewed-by from Simon Horman stays, and a
  Link to the review of the v3 posting is added.
- patch 2 is new: the net/core/neighbour.c hunk of the v3 patch 2 is split
  out into its own fix, with the neighbour maintainers Cc'd.  Asked for on
  the v3 posting by Jakub.
- patch 3 is the v3 patch 2 with that hunk removed; the sch_teql change is
  unchanged in approach. Reviewed-by from Simon Horman stays.

Changes v2 -> v3:
- patch 1, no code changes.
- patch 2 corrects the conditions to recreate the bug: reaching a freed
  master needs sch_teql built as a module, the slave qdisc removed and the
  module unloaded while the skb still waits.  The message now says which
  part of it reproduces without the unload, and names the neighbour failure
  path that drains the same parked skb.  Considered comments from
  Sashiko (nipa).

Changes v1 -> v2:
- patch 1, no code changes.
- patch 2 limits the reinjection restore to a top-level neighbour whose
  device has no header_ops, the shaper/eql/sch_teql class.  Commit message
  also describes how a master is freed.  Considered comments from
  Sashiko (nipa) and Sashiko (gemini).

Jamal Hadi Salim (3):
  net/sched: sch_teql: unshare the header before writing and fix retry
    strip
  net: neighbour: reinject a parked skb through a headerless output
    device
  net/sched: sch_teql: keep skb->dev consistent on the arp-queue path

 net/core/neighbour.c |  3 +++
 net/sched/sch_teql.c | 27 +++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
