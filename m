Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634551;
	b=fo+4oNWZ/pNVxsHyhDNTy8xlivzRSy9xAc8k8boM/Ygf23OPBWJJqy5fGr1nWXXTF+Y/
	 WU/9nk1aliFyjdwNq22PX4VIM96gqfBJGrSxPwtMwHLTScWm+mjxDgl3j8p7cCgx12lFw
	 vFg2IQTTVWNfL2aDd3JHJDgk8QLkd1sEYiXpKXpvWzebPIkJUitonaAAYYoLAERQ6NBw0
	 OVkTOuq7D4prcmlj50u1X8RJ1NSApZcc9kXZR3uCtqNyRTA3cOvwC1vo1euXSNM7wB2Hd
	 CH5k1wj5xbtDh3sRuFZoKGwKiLfdl94jZYzc8PLdS+ZS82v/NdOe4npIPl3/zvFAW0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YMqcMpSooEblTqwbk/T9EsawfT5EJj7H64/K4VkZDRM=;
	b=SsOQ5hQxGmOucC5KUK/2nSXs7qIEz2CMGz7ZAUCFbA/3FsxdT5k/evwgkvuGiRO1Pbho
	 p+DgCrOf0ai6OQowxAQBaVjfC8/04EkQStOdXwni252XBkBlQqw39e/VFUagDISbvt9O4
	 w87s2QW8thsiOOCi1uMQKePSFE1q/+DvfNubnSXzUjJ65JWYnR7sk62e6NyWA8rlDh4dp
	 KL0CJ9XBZS4XxbrVQymlyJPZWzzhAz1mpJy8vV44TRw+AIZ0qi+yWv9db55pIosncoez8
	 GdtNH0khjM+Jd5e+k+GvDEkBb2aYV379GoJhM+NP8kI59oUw+ySpVFlcywDBeweZ8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=WXkoBN0B;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE839606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE839606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=WXkoBN0B
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso2695737a12.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795634550; x=1796239350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMqcMpSooEblTqwbk/T9EsawfT5EJj7H64/K4VkZDRM=;
        b=WXkoBN0BNbx7ps0ZWtUQ8EvTqrHUUttgshJxarEZBFGj0eCpVjy9LMcqp21FiHzw/I
         yJoT6RHv4UckGdIAn0af50KqMJZrY7em+SEVHSVgModGAs379+xFcvi60dLAoYlElPEc
         hzTw+T+KlkD4dFN391+szqWaw2CuDwZwhVvoBvTRUQTWz7ci+VKfeo5/mf/aa8ARyFj7
         wIG1cXQGHj49g/HQ0/pagHSmg2gTRRQfNa1xcnEqfGwqoygNq2aLBqz2BloGyt35/eYM
         WibUYrdh/Gvi4VXKjPKMJDfuu/1ppXxRRAea9FYrOt/zZac6VMPUMDm2LunF6PpyCseI
         djtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634550; x=1796239350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMqcMpSooEblTqwbk/T9EsawfT5EJj7H64/K4VkZDRM=;
        b=2F+4rfsZBRdzu1EqdiOr2S/bC8xm4+lGvsERmZVKgB4BMo22b1T20FtEoBpO1g/fb8
         AhZ/Ecx7XHsJXGH/LzDJ791OrgPGwlsrQQQN0POr7hW0FrRNIm7mnHidgP0ZD6HVivVw
         zRZIhOPFCyD609LpV4mRsid3KANrqiw1j9LSkkOehfRxs+KMaGQpmD3mQnjJh8FI2ohE
         eNFWVuuTAmkVClhDkujKu+WfXPKDvJE6azWvWafW8h/ydWfpMm9UvoqY8ew0tmjJDjTb
         5Ia663zKDrRcp6PbZKMg2G8annAqUZUDXPatEuq2JRYj4nnSaYTDw7BhtTA+UkMDUq/M
         mBbg==
X-Forwarded-Encrypted: i=1; AL+hErEabJAFBTN2xseP9afO47C6+vp32WnFM65fOvGkZWS8vIWQdVLfYvGgp9B+IjMKHXBHl4DmIhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q6hRhjtuBmw/906l0pefEdgkhyMfDvQR4CP76yob45nMgmlfx
	OYYQdt3EM/xNU3GIfEMBhkPMZVDJrO9V/5wRhIlgQq6YZRaCDR2RYUHo1oiRIabenTs=
X-Gm-Gg: AZFdTZey0cFRFsycdejzElBidz226hug4B9myA713zpxIRR65cyALcJNgM62fVkB8sa
	SrXlJbvpswbwxplV1DuNsbpPxrLatw4cLnDIVTL2R10YWQMkCDPmNmXhEBH+r7FJZLerhlPj5w9
	SDv6LpCMGYiL/iMlTsNwP6buJDBC9k2Y5NBaig6RUERcgEZFTsKgSfd90bS3wbJjrB3E/+f5N+D
	yvM7SXbP8npLoExjPQisGcJZcXWoEOtyoxU+hC3m1V544cBWtKNHIKS5MApAvMTkR4zF0jm63P3
	RsqfCiCl3ui/oWPTt2QTvfgz+ifffFdk57jx0+R2GPNtjbK3fS8FRaFFWKiFXI5v/ftQ+8JIK2F
	x7UDw5ci3yMC1I8WloALef8hxpIjPXsT2O9496b6iTe3bi1mJhIDiWhIDmdrfTRt3R0o4CKp7lL
	r2WmV9K/m/rOqsjjO2CJyByyd2s/KXwSLoLHx8TC4ShtSnUPKZd7N8RPOiAcCvQdTTngsX9Hrwh
	7zjrmaU1i/c5WzOaSGeulw2a26u+MLQZqyQrg7H7V2/TDuO13jWn+X/OsW4FOEe2KI6ictT5Zz5
	gm7Z8RlF9P7k/bpQxnq0r2T7MgmlHdPA+UOUm9UBzbMhEyDkAoQdIAPOSdIbd8D/vkroCuKFEVe
	cD1r0udVXDDqT/ecTkL5uES0F3vU=
X-Received: by 2002:a05:6a20:7489:b0:3f8:78ed:b4f9 with SMTP id adf61e73a8af0-4014d45580amr18005071637.51.1795634550179;
        Wed, 25 Nov 2026 11:22:30 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d002a77sm9221778a12.16.2026.11.25.11.22.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:22:29 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: bird@lzu.edu.cn,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sd@queasysnail.net,
	tanyuan98@outlook.com,
	tomapufckgml@gmail.com,
	yifanwucs@gmail.com
Subject: [PATCH 6.18.y] mpls: add seqcount to protect the platform_label{,s} pair
Date: Wed, 25 Nov 2026 14:22:25 -0500
Message-ID: <20261125192225.48048-1-artem@trailofbits.com>
In-Reply-To: <20260509143000.stable-reply-0001@kernel.org>
References: <20260509143000.stable-reply-0001@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Sabrina Dubroca <sd@queasysnail.net>
Date: Tue, 24 Mar 2026 00:25:57 +0100

[ Upstream commit 629ec78ef8608d955ce217880cdc3e1873af3a15 ]

The RCU-protected codepaths (mpls_forward, mpls_dump_routes) can have
an inconsistent view of platform_labels vs platform_label in case of a
concurrent resize (resize_platform_label_table, under
platform_mutex). This can lead to OOB accesses.

This patch adds a seqcount, so that we get a consistent snapshot.

Note that mpls_label_ok is also susceptible to this, so the check
against RTA_DST in rtm_to_route_config, done outside platform_mutex,
is not sufficient. This value gets passed to mpls_label_ok once more
in both mpls_route_add and mpls_route_del, so there is no issue, but
that additional check must not be removed.

Reported-by: Yuan Tan <tanyuan98@outlook.com>
Reported-by: Yifan Wu <yifanwucs@gmail.com>
Reported-by: Juefei Pu <tomapufckgml@gmail.com>
Reported-by: Xin Liu <bird@lzu.edu.cn>
Fixes: 7720c01f3f590 ("mpls: Add a sysctl to control the size of the mpls label table")
Fixes: dde1b38e873c ("mpls: Convert mpls_dump_routes() to RCU.")
Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>
Link: https://patch.msgid.link/cd8fca15e3eb7e212b094064cd83652e20fd9d31.1774284088.git.sd@queasysnail.net
Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[ Backport to 6.18.y: 6.18.y has neither the per-netns platform_mutex
  (upstream e833eb25161a) nor the RCU conversion of mpls_dump_routes()
  (upstream dde1b38e873c); resize_platform_label_table() is serialized
  by RTNL. Use a plain seqcount_t instead of seqcount_mutex_t and
  disable preemption explicitly around the write section, since
  local_bh_disable() does not do so on PREEMPT_RT. Keep
  rcu_dereference_rtnl() in the helper because mpls_getroute() reaches
  it under RTNL without rcu_read_lock(). mpls_dump_routes() still runs
  under RTNL, so it is left unchanged. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Yuan Tan offered resolved versions of upstream 629ec78ef860 in this
thread in May. I have not seen one posted for 6.18.y, so I am offering
this one.

The fix is in 6.1.191, 6.6.160, 6.12.114 and 6.19.12, and in mainline
since 7.0. The upstream commit does not apply to 6.18.y; the backport
note above lists the differences.

6.12.y took the upstream fix together with its prerequisites
dde1b38e873c ("mpls: Convert mpls_dump_routes() to RCU.") and
e833eb25161a ("mpls: Protect net->mpls.platform_label with a per-netns
mutex."). On 6.18.y, e833eb25161a does not apply either, so that route
would need at least one more adapted patch. This patch is the smaller
change: it follows the 6.6.160 backport and keeps RTNL as the writer
lock, adding only explicit preemption disabling for PREEMPT_RT.

Compiled net/mpls/af_mpls.o with CONFIG_WERROR=y on 6.18.65 from a
cumulative x86_64 tree, with and without the current queue-6.18 patches.
No kernel boot or runtime test was performed. PREEMPT_RT was not built.

An LLM was used to prepare this backport and to check applicability and
stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg

 include/net/netns/mpls.h |  2 ++
 net/mpls/af_mpls.c       | 37 ++++++++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/include/net/netns/mpls.h b/include/net/netns/mpls.h
index 19ad2574b267..9b83b7f43d83 100644
--- a/include/net/netns/mpls.h
+++ b/include/net/netns/mpls.h
@@ -7,6 +7,7 @@
 #define __NETNS_MPLS_H__
 
 #include <linux/types.h>
+#include <linux/seqlock.h>
 
 struct mpls_route;
 struct ctl_table_header;
@@ -16,6 +17,7 @@ struct netns_mpls {
 	int default_ttl;
 	size_t platform_labels;
 	struct mpls_route __rcu * __rcu *platform_label;
+	seqcount_t platform_label_seq;
 
 	struct ctl_table_header *ctl;
 };
diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index 608c43a4602d..9ed136931c4f 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -75,16 +75,31 @@ static void rtmsg_lfib(int event, u32 label, struct mpls_route *rt,
 		       struct nlmsghdr *nlh, struct net *net, u32 portid,
 		       unsigned int nlm_flags);
 
+static struct mpls_route __rcu **mpls_platform_label_rcu(struct net *net, size_t *platform_labels)
+{
+	struct mpls_route __rcu **platform_label;
+	unsigned int sequence;
+
+	do {
+		sequence = read_seqcount_begin(&net->mpls.platform_label_seq);
+		platform_label = rcu_dereference_rtnl(net->mpls.platform_label);
+		*platform_labels = net->mpls.platform_labels;
+	} while (read_seqcount_retry(&net->mpls.platform_label_seq, sequence));
+
+	return platform_label;
+}
+
 static struct mpls_route *mpls_route_input_rcu(struct net *net, unsigned index)
 {
-	struct mpls_route *rt = NULL;
+	struct mpls_route __rcu **platform_label;
+	size_t platform_labels;
 
-	if (index < net->mpls.platform_labels) {
-		struct mpls_route __rcu **platform_label =
-			rcu_dereference_rtnl(net->mpls.platform_label);
-		rt = rcu_dereference_rtnl(platform_label[index]);
-	}
-	return rt;
+	platform_label = mpls_platform_label_rcu(net, &platform_labels);
+
+	if (index >= platform_labels)
+		return NULL;
+
+	return rcu_dereference_rtnl(platform_label[index]);
 }
 
 bool mpls_output_possible(const struct net_device *dev)
@@ -2582,8 +2597,14 @@ static int resize_platform_label_table(struct net *net, size_t limit)
 	}
 
 	/* Update the global pointers */
+	local_bh_disable();
+	preempt_disable();
+	write_seqcount_begin(&net->mpls.platform_label_seq);
 	net->mpls.platform_labels = limit;
 	rcu_assign_pointer(net->mpls.platform_label, labels);
+	write_seqcount_end(&net->mpls.platform_label_seq);
+	preempt_enable();
+	local_bh_enable();
 
 	rtnl_unlock();
 
@@ -2664,6 +2685,8 @@ static int mpls_net_init(struct net *net)
 	struct ctl_table *table;
 	int i;
 
+	seqcount_init(&net->mpls.platform_label_seq);
+
 	net->mpls.platform_labels = 0;
 	net->mpls.platform_label = NULL;
 	net->mpls.ip_ttl_propagate = 1;
