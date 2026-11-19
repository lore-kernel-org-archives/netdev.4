Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067859;
	b=Whj/HUyEgCHbPdun/3DDpOV4WVKp4KXeYMIlXJ7+v2h3bSLzL1IpUyPh/PnIp/tRUWpe
	 fH8a5E41T/Iljze8MHGTvlVS2bx2haqeJ0mHTpsFLmnLgG/APkyBc9VtURjrcyziWJNM6
	 UxqAiiXL6NtOwdFgkaCiGxKSlES61HJswhcsxZUMSU7AjWm0sZ8BTa0WK2fUV9EhJAW9E
	 v1vHfSK+rOG44hAI8xO9mkuerqjWH8l2l5VWtvpoD1x/CwZ7BxTSP7VN/PxARyJkND6Vr
	 KX5FAIZqOtP9oy42RWVdr7ZRWGIPFw0GuGAKIU3RM4Gd8girXnT3f2vpu0ofwn16bDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
	b=FY879dBt4TDERAiPE6bvBZvtsUFtOl4Ms/PL5mk3m324ToPTD6jjsS5t0lmQ1Vdy72gu
	 +V0RjpBnr5Ci2J6mH1LNZVLyK7BTKxln4CTKuCpct9dJf1X45dqMmg87gOStx8lkD6rqb
	 Hf+JM89e3fcSuqz/zAitJBk+f3CnBJBO3NsAYFpKQXY53djXKK1t+E7UpPlOYjSNSRPZV
	 DSZ4vzw5KpnvwjH94VuGcM7D8axDqCgYuZXPKTyXq6sJzl2xWud7WSuzTTKjp8q9Th2pX
	 cH/qtsTvg33nJLOn8W8RZ/1j/K5f0Or5crbVQB8vMpvp/gg6ESkH7Pct0TmJTdycLUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBA65JUb;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA2606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AA2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBA65JUb
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3bf3bef9aso1758034a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067858; x=1795672658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
        b=EBA65JUb+bv2UxY2ox9eUzkzbeuUUw25Vutf0qUGRIgv4yUMPdIa01zPNzSecI5h6o
         LvV/MaALWu+lrWqnNbdkPMcsXFsMqrmbAO4HF58np00QKwOT0Rn390YRRrA06NdJb3YE
         l+8wAs7RP1X3AL0LXmwo60pZ45zGKfXeO+bSECABikv6xbuWtV5cEuoTxUj+f9XM5V3w
         ji8xI21GvwnThReOV2IGKhi4SKnhmnqnOVkPQlpGsYSxqQNwf1C6CHQSPyqXneS3w7+a
         C+HiTPvJ/Ux7yEelEbHs2YVn3WuNgXiLl9tG9dyh41v4dGbg57n7xheH67UenNciLrnL
         waqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067858; x=1795672658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfJFOLv++WC9m0JyoYaS7BgHTNo/5XDIGUv7rymNFd8=;
        b=tNhR8vbdfZUxa/QWvSinBtOFoUE3ku1HLzXC7+RA3GWxNWKHQ0bPQn+Lg1cd20H6cH
         fRRPrNQ1bGsVgAs8zIpKqjEQ2jdo6pX91x624MmrFTLk1oY3a82F4Tkve439TibuOIY3
         YVGu+keL0LQhzV2BvLBa6cJzk32FSUw/LUj/VPvDzY00af+hqdvL8tKRvCtptLswlXXo
         MZCu+/aWNEUecAXPyKhioQGFmKwDb1R4125//Qrf/6UNEVPYsEHSbsI60jF3cR0ZOyTa
         /Z0hYaMe5/XWCfaiti+hI1q9kmDyOBMuppY8sNDEeJ1fHn4WlEdagEdEP5BeVhWDXIJ/
         IxXQ==
X-Forwarded-Encrypted: i=1; AL+hErEzOF1bDVB65Jw71T4N64d2DvKZy6KK650RFln93WYE8Ld62yO6WDRXDg+hG1tKEVBCH9OYB7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z93LfkpmvSXVIyyWi+NoFgTqu5nEx4wW/2ogC6VjZIW+0J2toOJ
	tgrKRJh/K4/xP176/kTlqHpaXIk2cHIEEnyPT6XcDRZFUFHss6Fxkee7
X-Gm-Gg: AZFdTZftCGMRSmb+Hc5IcLNdzO5gX+caYa2ZozLWuVLsc0rkWByVCHWEpNeClZ3MyuS
	/fYeqrxuGgGyfMHHB/SoBrnkFUPlyth/KpwH13dKNeczW8O18eFH2mURqDZerUAHYGhjvv6GoFB
	yaCRGuhvqszLaXYjF9LJBJ4UB8WvH6Ca/iWbfmazU6OYTglFm7Jq7V0WhHU1atGaJ6XsiZQlG8n
	xsZDBBqYh4LLt21XuTOhrIJftOtx6YJ08BEb48d1Zm62TZC84aIi0l6nyEUSuav6c5sRx4C4Ln9
	pUQ3DkqIpeV5La65XjNxmN8WiCYCKzxQLvA9sc9efT1EoVzOBRaeNd1IsoitlMfUg154AOqXr/Z
	j9bb9yny9Ac1flro8dVhfPGz6dXd0lu5IniejaovDsifl8q79ktmpo0H/T7+YZmG1MqIptHDkac
	8nyAqHd23wLgZbj50qR+y+U/UJtsUqjiUBdlAdVvZ5DyoN/gPyJggY66YVLkKx2PyxHGhKxtUwX
	faVchiyNtg0a4H6iv7WOKCN4eFnKx6+J/lwfcSNuefAIcwABeGOPgn5kWO4BGKqrbn/TdGB2FfQ
	1Ra0EP+FkadMt8R6Z2nVirGKA3U4oQV20eEPCfEaM01JWPLPpRX2mXikHb0SVPhR/YiNdIY=
X-Received: by 2002:a17:90b:3c04:b0:3b3:adea:4b04 with SMTP id 98e67ed59e1d1-3b3d07bf9c0mr4206369a91.36.1795067858445;
        Wed, 18 Nov 2026 21:57:38 -0800 (PST)
Received: from localhost.localdomain ([155.69.167.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ec9cd0sm24469175ad.11.2026.11.18.21.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:57:37 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com
Cc: m.wilczynski@samsung.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH iwl-net] ice: Do not free a preallocated node in ice_sched_add_node()
Date: Thu, 19 Nov 2026 13:57:31 +0800
Message-ID: <20261119055731.55798-1-izaiahsun@gmail.com>
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

ice_devlink_rate_node_new() allocates a scheduler node and stores it in
the devlink rate as priv. When the parent is set, ice_devlink_set_parent()
passes it to ice_sched_add_node() as prealloc_node. If allocating
node->children fails, ice_sched_add_node() frees the node with
devm_kfree(), but priv still points to it, and later rate operations
(setting tx_max or tx_share, or setting the parent again) use the freed
node.

Only free the node when ice_sched_add_node() allocated it.

Fixes: bdf96d965a20 ("ice: Add an option to pre-allocate memory for ice_sched_node")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Bug was found by kbound, an internal static analysis prototype.
    The fix was written with the help of Claude Opus 5.5.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have E800 hardware.

 drivers/net/ethernet/intel/ice/ice_sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
index a5c7a4e1ceba..dba6cc912b7b 100644
--- a/drivers/net/ethernet/intel/ice/ice_sched.c
+++ b/drivers/net/ethernet/intel/ice/ice_sched.c
@@ -210,7 +210,8 @@ ice_sched_add_node(struct ice_port_info *pi, u8 layer,
 						   *node->children,
 						   hw->max_children[layer]);
 		if (!node->children) {
-			devm_kfree(ice_hw_to_dev(hw), node);
+			if (!prealloc_node)
+				devm_kfree(ice_hw_to_dev(hw), node);
 			return -ENOMEM;
 		}
 	}

base-commit: 6055ab4d82e42de89871db03045b568ed706ef50
-- 
2.53.0

