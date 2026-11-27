Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789664;
	b=VOfdIWbV9FI5rfFlDqyId4c3fBJDf8LegWpYkpYVmm9xJB/c2Tx8FcyQf6fzIdpCcd//
	 7k215EGPTDz3SqfBg8bsY7tAgn55HmqMtVs+f/2PPMRpFCIKe6aOwunaO97ECzoh61cjD
	 pjgiv6lEL1ZaY+heQ1O4sz+E/BwzwMcQxK40GRVgiR5cIJgSpKUYE/sdPwdfUKRp6nfjh
	 cwt7cWuGHRmfUoyJIaHidyWlzQvGq5Ij55/TNvQXB6tW/S4QIMdQ2ZE3ODWS5ep+VVTrw
	 IM9KMEYpf1QZIFje9/RRZVuX2OPe5QrHtAnCjgd7/eLLc5sG9UaZe0g679AOm5MpXmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AAcb5vfaAA7rQOvxn3vN2wvPr8anCPC4jvF7VU0us5s=;
	b=ViJaL+bM3pfPTJV3ntX2MyvXsCQdJ9SsCuakLAteHCkQ4UvF8UZbCQsAduy3PDlyLmMq
	 ne67p6+tAsRylMGrE1k6JX2l1uE0KTTzbVxlUzYdP5fFyEtaJV0YGzJAmSb/HSlseN1IJ
	 v3tfCYRlPNUCenMLpDHEc6d9SW/OgsAhENTLoDAzczcalt7LuyrEz4p7VuYeoiqtyOpem
	 BG/CuoPyKAkwIlDMPg6urLM9K2cZvhOBoia3qfwwn/P29gCMvIhk59fKaIDsiBODyhxax
	 G14Yf4bhtkUndnPl3crSZrMvVJIxOpK+HqukQHD06w3fegLq15kT1MxXMJV6yI7Sc3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTjQaEfm;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB0606C2D8
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBB0606C2D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTjQaEfm
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3957075b3a.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789664; x=1796394464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAcb5vfaAA7rQOvxn3vN2wvPr8anCPC4jvF7VU0us5s=;
        b=uTjQaEfmiSinhlwwTJeNkxeUQiIliw6n/EsgqcVXpD26QIrQMg2asVmqAvJCAz/ebV
         wvoUpzvESTPjB9Td5sMaxXXId/E/PBUc6+IW2PG5uNcKAOMNQxHu8Q/RqYnLRPqY/Mmn
         x+cJOudaSvvJCM4bOm647a6P0cQYCJnZSBAxAQNX/vZxmXpgwlLk6qrTBcRlWt5jSQaJ
         P6CAR4wg8vlcvQZBbetJHmdaGVS6R60TrnDAQa0SwGty1FZyOuA3906TJDiFOxHjIraF
         2Ome3CQhv4PkFgIwokBv+m2hLzGMAofMDhJokfPyFrIu/A3w3lscpX+E65VC5+nr+bJW
         FCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789664; x=1796394464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAcb5vfaAA7rQOvxn3vN2wvPr8anCPC4jvF7VU0us5s=;
        b=tWQAmMil0oI4Fn+U6ZMsOIvsHydJ38yMQ35WRZRdXWtt7teEt5nRxBy2MpUlNE8OZf
         J0raBGYpUea+voASujWtqMBMMyJDGuRYIvzdAtqTcIVyu3Kq4v56T6i7nG0N4eH5A5pQ
         nRkW7mf6qW5YHP9x4fez/QhguNqXMOuVnHuLauT/jnez/fo5U7YfI80jLhAwD86Liapy
         ZCrK2BNv70v9J81ZU21qUzgvyS+LQfC4KVwPjXfR4PUQYd8BOFmsnJahUUuTc5r8LDNQ
         hmNAsdZNtv2FJ5XW+6s3xjhq6wLF5GzylIJWs/kYQ5FfrS6m3R7WnHinebDrpiDqfbKI
         yx7w==
X-Gm-Message-State: APuU4Z/oAhNvrlnjkb0rimK68eW5t2XKMj913eoTU/Dh6Vf3HsdyEAmP
	q4zOxZY3yer51Xh8a4cQ13weacNnZrOmscJY5bt5jrYuZOrfKvnmg2E8Ab4mUg==
X-Gm-Gg: AZFdTZcx3+kIbFMxZPKw7qnHb15Tw9HZI7Bw2EPl71Ygz4dDfMBsKoKhK8dd6KQ1SPk
	RYIFf+gW2YU5WX+3JvzVHsuo2UT+a+D+zJeDsmsel0bLNroK/NfJXhdjvNslTTjH/dgOsBfuTSu
	wTnWeJMqzW27nnsWyKFiUT09MK+pP0BNBC1SI9DN78P/Qh/ka0nbBLOnZHTEfQL8yudeuo9IWCV
	kJn/s2TQz9rv7gS3bR9R8uoPBVTAVAUDfQ5EYOq1o0DX5NgL3suuNjqW4kosBmHsaTocOSyuPK+
	5nXXLrXSXDsLJzfsgzJAAxKKwhY6TI8tydSf2Cu4ps4ZJXJueFFS8V/5/xXYNyFsqfxLKPt4Vn3
	ayPpjkgyG9qNuy7siJkaynTX5KRPkd9KfpeS4a7Q0lKXTNhVIowD61SFG57yaV6DTpuA/J5RJ+L
	Y3ezEvIqmGtfFvFuVb3Gabc7XHq9aziIiyZyD0EvzjXjpB62zt94AHSb+qQZ8vJfQbgeh/CYzZ+
	4MV+vWMD9iI/bX3ukIKrpoZfazMor1rExamGsCfWaW/wfRy8h7WteueLoLuqhkEXy6kFFEUbHEd
	KlFl1SGaYiVkt3u/zrEwC4TkeO/aWQ4fkmBsz2PR3x1M/fNOXvrSUNA=
X-Received: by 2002:a05:6a20:c887:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-4014d14d239mr26392350637.64.1795789663419;
        Fri, 27 Nov 2026 06:27:43 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm12578021a12.21.2026.11.27.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:43 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: dsa: motorcomm: Reject isolated redirect targets
Date: Fri, 27 Nov 2026 22:27:28 +0800
Message-ID: <20261127142732.1337041-1-mmyangfl@gmail.com>
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

Port isolation takes after REDIR judgment, but software may deliver
such frames. Reject such offloading.

Triggered and verified on YT9215S.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index e3f057ed580f..5713ae84ece7 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1064,7 +1064,10 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			terminal = true;
 			break;
 		case FLOW_ACTION_REDIRECT: {
+			struct yt921x_port *pp = &priv->ports[port];
+			struct yt921x_port *to_pp;
 			struct dsa_port *to_dp;
+			struct dsa_port *dp;
 
 			to_dp = dsa_port_from_netdev(act->dev);
 			if (IS_ERR(to_dp) || to_dp->ds != &priv->ds) {
@@ -1072,6 +1075,27 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 				goto fallback;
 			}
 
+			/* Port isolation takes after REDIR judgment, but
+			 * software may deliver such frames.
+			 *
+			 * Bridge membership changes may break existing REDIR
+			 * rules, but we cannot do anything here: driver can
+			 * neither reject such changes (port_bridge_leave() is
+			 * void), nor tell tc which one is invalidated.
+			 */
+			dp = dsa_to_port(&priv->ds, port);
+			if (!dsa_port_bridge_same(dp, to_dp)) {
+				reason = "Redirect to another bridge";
+				goto fallback;
+			}
+
+			to_pp = &priv->ports[to_dp->index];
+			if ((to_dp->index == port && !pp->hairpin) ||
+			    (pp->isolated && to_pp->isolated)) {
+				reason = "Redirect target is isolated";
+				goto fallback;
+			}
+
 			action[2] |= YT921X_ACL_ACTc_FWD_EN |
 				     YT921X_ACL_ACTc_FWD_REDIR |
 				     YT921X_ACL_ACTc_FWD_REDIR_DPORTn(to_dp->index);
-- 
2.53.0

