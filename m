Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675447;
	b=y36mvMm4fxY+Qp874Lwow0qs9JmuWV3XrfgFxeyT1R7qIJAWROR2hIHwWWXn70FxIG+w
	 RH+1oHHEpY+j2IzeKxapjHjaDT/BICc3I9BfFmHDBQm7O3teGMkbtTGs6bMPreFOE2Nfw
	 0WRLIPDSVE9Xblw8sw7PaSh4A0EPVCEuj4xS+Xacb5QS6uriTPKw/v+cSBWl3M8YA7nE2
	 Fbx+MyFIGAD2l7cclTW390tO+fMo0D05Wa8qyOshcuYbFl1RvjZmFdv5e6jwB8q/vmwYt
	 W5IqWI7INUOof1cgGaHu+Dg8b/j44NNRuUlWLT+myeTTK+cJQaUngeriFXjYOAuIypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IGOZXvHj7Kp3VoWvYB9VXQ2RIbnpFsMHzOt42EfzF7E=;
	b=1EVYUP5nUZx7hmU5YUdnDM3ESmnUHMcNjTENvjmq0i1TaZR3jGwVURSuDb138w3IEV6Y
	 ym3LP9Omgr4XMzIhfbTzXhrrW3xStKg/N1BmDOLm5kyn+tBC8hK5vDULjYrEmJwyUotEg
	 OQ2LwYoEXMl542xCieVfRrHlZcSn9LyuLCj8+ct5WIlTYI/VXqlLVf/DOYiLJ+wLpgZr+
	 mTaQXQhshBSVh859Ab60ncXw6OnCiRI4BD0VLVwAn7XzL1VaoNKIekISxfJQXOBzYcCXW
	 3n0XB3DR6kY80WFSNhX9L5GWWVkpBDAskVWhHMiLwA2DFtfI7I+KDUu0MiEXmhgFoDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SW/gpPSw";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDD606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SW/gpPSw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385c497bfddso690097eec.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675446; x=1796280246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGOZXvHj7Kp3VoWvYB9VXQ2RIbnpFsMHzOt42EfzF7E=;
        b=SW/gpPSwuwYwkhXGjSM+9f/HgBYsqbFafnPdJDDbC5Qp4UMNOvjxX9xs8KaS4bZ4F3
         erzj1yGSrxdCYoXeFv0PxyvDW0ORGraFyRdQAiwgDM/bjFHG5r1dTw7pPA03zQhc0azy
         2f863bf113sAI02qZBZJkEaNI4aBIW1oHrE3udRHebf3kPCgRsHAThSkDJRZHAW5gR4b
         XYCQp3fBBr0pOV5t8SH5Fkdn7RYiOeYF0im3ymbB0TUzHJq+HjWH5Y2ciDdZFWbfzW/N
         wzVm2jIuVC32D4/hZLA7nO64nJPMHhsEEAQBljISj3P3Wfef71Jm0BctmbTS+jZMCVkT
         CJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675446; x=1796280246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGOZXvHj7Kp3VoWvYB9VXQ2RIbnpFsMHzOt42EfzF7E=;
        b=uwroBJNYg+giVbg3Ol4n6FFPUZxBF+ZpnK9h5Rqi6l32BNrI+Vpixqmjcg0XNKIJ69
         tUeKW6Qtx3c75TJs2gW1lf+lBnfZ7QYT9++2j1KsY1BCp+QloGSa1AJmGsnJQ+ory3PY
         T3yitA1phNWRZxhgbkB9AO/3rhsbOowx+loN/ybkw9J+Q8tFuaTiWkjyQZmXipV8OdiT
         G3mBGxY2yu6VnPA1niIJ+dHsBbwZNmHwUnnk2+0lIAh5errKLB2Gx3rNiHWHEGiejQTe
         njCoNpK95KophetnRqG764nzzR0K9k2tK2Rc5nar51SqLwrv0UnepyHkBEeaxDxM0W/w
         yoFQ==
X-Gm-Message-State: APuU4Z/RoZkWRTcKc5WXJCUiMWKzpmAzD9x3c/hfDeAVaZA6kkucJTSF
	HKJBBIWBablTnmMIkFS2/CfJVuNSw5q1eRPZqTWGE9WQZUsykoIGdSOf
X-Gm-Gg: AZFdTZf1lCELwIV3LCl0yWNGaXUeilm5vn3XsKKuo00Vjr6sBnBeKjprK0gSxw1/WBA
	EEeH5n9Zau+MTr0VQwhATZoVv1/+ZBQwzjuz6wbvyKOUqw/vQBgaJfVm6YGSaLyXOKFEcVin4H4
	ryQ7133pxmmhGHYRttdfAQSsjsJUTWn34y2aHRpc1WZBSiA2kj0BbhcwlATSSyxqCrk8FLRuHw9
	QhWuuLna3fj876xRbRD1Wks4K0wqyugqlC0vckkQaQIfxVxxsz3o8A0fMUzb2lhm3150mLDSALZ
	Mz9zInEoTG6j395qtlao5uZO6Y5tbbG9mUxs2RJ4cJMkJ9g3Sht1OLDdfsu4T4SOKl77GuGpKN8
	DDF3/HPf2Sg9Y4zENOgAmZNGudLkLSLMEKjcLfEwfpuKx/9jQcZDOl32NFDxfkQO168r4k48Ewt
	g2hSnLOmHp0dYppayACUqyRskojhtt4xK9b9PUTDzArt65mpwgmN5w8RuvkbL4E1dqdVFFHTVhF
	5Cc7sM7OCGOLLVvGiDpZEDAsK6JMqCwTMYDLWhkUzQoDO2gk1KNPZ4fZ/FO/e+3GA1HyaGbemYO
	d45POzGH7IBCU59AyWdIzGG7WY4f36GtYDLurLz7Lzq363BgWECHYA==
X-Received: by 2002:a05:701b:4558:10b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5568bfe8cmr29796063c88.2.1795675446057;
        Wed, 25 Nov 2026 22:44:06 -0800 (PST)
Received: from localhost.localdomain ([14.47.155.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm76548135c88.9.2026.11.25.22.44.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 22:44:05 -0800 (PST)
From: Minseok Kim <kor8821@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	m.wilczynski@samsung.com
Subject: [PATCH iwl-net] ice: bound the node count in ice_sched_add_elems()
Date: Thu, 26 Nov 2026 15:44:02 +0900
Message-ID: <20261126064402.87229-1-kor8821@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ice_sched_add_node() appends to the parent's child array without
checking that there is room:

	parent->children[parent->num_children++] = node;

That array is allocated in the same function with exactly
hw->max_children[layer] entries and is a separate allocation from the
node itself, so a write past its end lands in unrelated memory.
Neither ice_sched_add_node() nor ice_sched_add_elems(), which drives it
in a loop, bounds num_children.

The bound is enforced one level further out instead, in
ice_sched_add_nodes_to_hw_layer():

	if ((parent->num_children + num_nodes) > max_child_nodes) {

ice_devlink_set_parent() does not go through that wrapper. It calls
ice_sched_add_elems() directly to create a node for a devlink rate
object, and has no equivalent check of its own, so re-parenting rate
objects onto one node is only limited by how many children the
firmware is willing to create.

Bound the request in ice_sched_add_elems() rather than at the call
site, so that both callers and any later one are covered. The check
sits before ice_aq_add_sched_elems(), so a rejected request leaves no
hardware state behind, and it returns -ENOSPC, which
ice_sched_add_nodes_to_layer() already treats as "this parent is full"
when it retries on a sibling.

The existing check in ice_sched_add_nodes_to_hw_layer() is left alone.
It returns -EIO instead of -ENOSPC when the full parent is the TC node,
and that distinction is caller policy rather than something the callee
can reconstruct.

Both callers of ice_sched_add_elems(), ice_cfg_vsi_qs() by way of
ice_sched_add_nodes_to_hw_layer() and ice_devlink_set_parent(), hold
pi->sched_lock, so reading parent->num_children here is serialised
against the rest of the tree.

Fixes: 42c2eb6b1f43 ("ice: Implement devlink-rate API")
Signed-off-by: Minseok Kim <kor8821@gmail.com>
---
Found by code audit of the two call sites of ice_sched_add_elems().

Notes on testing and tool assistance (per
Documentation/process/generated-content.rst):

- Tool assistance: Claude Code (Anthropic) was used during static source
  auditing of the two ice_sched_add_elems() call sites, to draft the
  commit description and the bounds check, and to run the build and
  style checks.  All findings, the code change and the commit text were
  independently verified and edited by the author, who takes full
  responsibility for the patch.

- Testing: compile-tested only, on x86_64 (defconfig + CONFIG_PCI_IOV +
  CONFIG_DCB + CONFIG_ICE) with `make W=1
  drivers/net/ethernet/intel/ice/` against a baseline build of the same
  tree: 0 warnings and 0 errors before and after, with an empty diff
  between the two logs.  scripts/checkpatch.pl --strict reports 0
  errors, 0 warnings, 0 checks.  No runtime testing was done: I have no
  E800-series hardware, so the capacity path was not exercised, and the
  behaviour change should be treated as untested on silicon.

- Not Cc'd to stable: I have not shown that an over-capacity request is
  reachable in practice, since hw->max_children[] is itself firmware
  reported and the firmware may refuse the extra child first.  This is
  offered as making the two callers of ice_sched_add_elems() consistent
  with each other, not as a fix for an observed overflow.  If you would
  rather rely on the firmware here and drop it, that is a fair answer.

A separate patch to the same function is on the list, "ice: Do not free
a preallocated node in ice_sched_add_node()", Message-ID
<20261119055731.55798-1-izaiahsun@gmail.com>.  The two touch different
hunks and should not conflict, but they may want ordering.
 drivers/net/ethernet/intel/ice/ice_sched.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
index a5c7a4e1c..ae4528347 100644
--- a/drivers/net/ethernet/intel/ice/ice_sched.c
+++ b/drivers/net/ethernet/intel/ice/ice_sched.c
@@ -909,6 +909,14 @@ ice_sched_add_elems(struct ice_port_info *pi, struct ice_sched_node *tc_node,
 	int status = 0;
 	u32 teid;
 
+	/* parent->children[] holds hw->max_children[] entries for the parent's
+	 * layer and ice_sched_add_node() appends to it unconditionally, so the
+	 * request has to be bounded before any node is created.
+	 */
+	if (parent->num_children + num_nodes >
+	    hw->max_children[parent->tx_sched_layer])
+		return -ENOSPC;
+
 	buf_size = struct_size(buf, generic, num_nodes);
 	buf = devm_kzalloc(ice_hw_to_dev(hw), buf_size, GFP_KERNEL);
 	if (!buf)

base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
-- 
2.34.1

