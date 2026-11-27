Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762687;
	b=3lFT596HJHLLmmrK5JW8UjUyVbNIw7RwMCFonepUARZfh3rLGZCLGHqEqJQV2RdY2Wkt
	 07ihNedj1EKQ06E9s3rXp/urV4HrLBfWdEu3yFC+D7UcDeiFfE0Uyko/dJYrOi/O8uh2x
	 NSRS9lmv9ILjCNBpoAOhYll0nDInrf0djSTiDaLoOowVXsJ/r/Ebypngl6UuD80SZbNPt
	 iaVkQzR4DQSaUxPpE58hlDT4IgfpsISdRdHxnqCfmUpKh3whRfnVdoDIj/1wOgCW5cg+m
	 r0Xx3+2RacHbwsFETYIr5DrFpPSgmAxrtHiXONm3eeTXrt/YgipYKJJ23ZeyRS5lPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rw/R6ybt1QcdjNXidw02ubcIKo06kOfp72MwTKAEG3k=;
	b=W1ZAYiH28NWBba6j7mcH/GxT6FL25JbtmvyRgv48vU+3Jv789YMQzYcHWh6OA/w4lC/3
	 +5OBmEv3PRbP9J8fv5om7DtqUaNYnydj/8WxIQ4ivKLMPuDfrr+by44SGNA2c1Sc/yL9O
	 z6xdQalEBp0MYeB0nASlK2D1RE8PV4fafwrYBbf9Z3LSm/JhQlb5GvZitqE5JGuYZKqZr
	 mAnWQQl5yD0PlRXRJcCbn5PPy0lARSl0rjN9gYuMnQtFZ5ODFv3DZ6NUF/MoiU6V6TkGD
	 cu7LDBB2tSnHI+i/FNFx7vXDQguiy2zkXrYLubJTFsBu2jUbdEfdGH6MJFOlSKSn9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COZN6MOj;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D4606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COZN6MOj
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so3800696a12.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762686; x=1796367486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rw/R6ybt1QcdjNXidw02ubcIKo06kOfp72MwTKAEG3k=;
        b=COZN6MOjsPcFVoEeaiGgsF+/e6tTcTZQS9iRwunz8SIJCHdPJcBNTnk5TjH4KXx7DW
         w2SRIJzKtvud7uFtk7g5lKf2J8CIo7oPBvqwPyCrMMpHIJ9uhv4momkzYxzNwz7MRyYT
         XBqPOLxFU6An8CjL1rcCift2PtL4/F5xHSZs0wlA+WCFb/6BE42czIGVK6Zwmmoe7RoN
         SOaqabns2twyFyOdfjukt0TRzn1syR8rxe5ftrwweUoLbZpk0I3M+jQ2fDvnosfEIIb5
         pWdw0X3vITHsA2RM+PL2X4YTY1PrZT210gySkcP1W4Lx5DNEVpdcclcIbaKKZN8FpC6d
         Cqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762686; x=1796367486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rw/R6ybt1QcdjNXidw02ubcIKo06kOfp72MwTKAEG3k=;
        b=YI8DP/b6WVfL3hm8ZGDsdVSnU5eBSQOdyH2wPSIFnbroc/5t/nlbalV5r5lY95KrHc
         ACyakwRp6MMtQ6JSSOFmrjkdu/uMApmxVcZhhHoNHOTRePCJSUQdt9FwKceJwMKUvLoz
         TMWB4688eNP0ySHRmRmHiYq7t308aer6cfwhxZhUSkDwIvgSlEPpXkA8uHbwvoTrl9/p
         wKKzDLANHNfmPFeX8xhBv2EP9wQWeFa/61TSdL58zAPCjeyEZYMpKJK+6OwscuGYNVxD
         6c5eYlpyPecF22Ct4a4Hn2LnRGNmnsxrdlmh1Tu5oJ6Xgm1KN7JjLmqevVCC7XXGVWQ2
         pgtQ==
X-Gm-Message-State: APuU4Z/GVqT4V1wTwZY8pTD4I/4B/Tor0BkbEX/D/oXuxIIhIkxiKRHF
	tRqT7cZ356yuPxZ1HJhZyHsdMLJ/PMl9xL8f7UGsPioUQWjQrbubuHav
X-Gm-Gg: AZFdTZeNjVeui+iq+fx4VMJuVdlyWJDIK5hTK4eWLA/Y52WqizYqCdf8HOlLxcVsNgM
	8Wfy4ACm0bYHIiIy7lFontB1w08NYNXiFX7MwFOaEaSx7Pxue+IXmPnW8Au9R0pZkDDt9MhFnGz
	2Ub5puCOhTvNby1vq/7/fhvwjkcmIPi73tgbFYPP88xAMPTUxezaEv8BZu5DIGPKi+kDPBnkH8A
	oqu1BmW0xH/33Ga39UhEBJA/62VX5/vY6erytGWuZPxbtzAAurVNP9Sq3Y2aQdKQHvFpvUEZWIV
	JTgacNUszLuoEQnxm5R0GZRR2fBWedsBm1GQHkKHlBJd779xp7gepvXhYvAyGSRtFCSvrkgris9
	LX/V6NqtUtHePdnkvnOjl9mMI/a5lEB8SSgrRG8HcUy8JEnY9gJ0wF/nzc7CYQrJljlLKUL7IMn
	HDb6I2kuVJNzliU5fVQMIovsB1pb+58eCWt7yH6PKKf+hFKyLOYNDJOJKNFB5RaVCZZPGiL1ojm
	Drq/3Z5nwSFAKXWlNAsp8Wjj5WTsWRPO5LcDXEKzR7tGyb9q973RMYmyvI+f0Ud8CAibB/YiHSd
	GfbjC5Bo9jOAzTcLdHdmX6r+3ensU/gtdQN8O/0gfMgw+cpL6iAvQ9lbGa06kqesW/ZdIUHTxDM
	A9eaKZKA8W47VeX/fMecGSw==
X-Received: by 2002:a05:6a00:10d3:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8c87bfa1ebemr20969839b3a.27.1795762686230;
        Thu, 26 Nov 2026 22:58:06 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c228sm11839098b3a.10.2026.11.26.22.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:58:05 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pedro Tammela <pctammela@mojatatu.com>
Cc: netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net_sched: hfsc: clear el_node linkage in hfsc_reset_class()
Date: Fri, 27 Nov 2026 14:57:56 +0800
Message-ID: <20261127065756.2927925-1-bsdhenrymartin@gmail.com>
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

hfsc_reset_qdisc() drops the eligible tree root, but hfsc_reset_class()
never resets the linkage state of cl->el_node.  A class that sits in the
eligible tree at reset time keeps a stale linked node while the tree is
gone.  This breaks the invariant that the linkage state of el_node
matches the membership, which hfsc_change_class() establishes for new
classes.

Two consumers trip over the stale node.  cl_in_el_or_vttree() reads it
as "class is in the tree", so hfsc_enqueue() never calls init_ed() for
the class again and the class is starved permanently.  eltree_remove()
later runs rb_erase() on the stale node against the reset root, which
splices a stale sibling back into q->eligible.rb_node and revives a
class the scheduler should have forgotten.

Clear the linkage state where the rest of the scheduling state is
reset.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: ac9fe7dd8e73 ("net_sched: hfsc: Address reentrant enqueue adding class to eltree twice")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/sched/sch_hfsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/sched/sch_hfsc.c b/net/sched/sch_hfsc.c
index 284490fd6ca91..e64df06429239 100644
--- a/net/sched/sch_hfsc.c
+++ b/net/sched/sch_hfsc.c
@@ -1491,6 +1491,10 @@ hfsc_reset_class(struct hfsc_class *cl)
 
 	cl->vt_tree = RB_ROOT;
 	cl->cf_tree = RB_ROOT;
+	/* hfsc_reset_qdisc() drops the eligible tree root; the
+	 * linkage state of el_node must match the membership.
+	 */
+	RB_CLEAR_NODE(&cl->el_node);
 	qdisc_reset(cl->qdisc);
 
 	if (cl->cl_flags & HFSC_RSC)
-- 
2.39.5

