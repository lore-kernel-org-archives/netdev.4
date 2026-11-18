Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978772;
	b=CqjeWQVaqFfgkZ+y7Ch6sQu0jyE22T6bj1ezduNkcqnET47V/FLCONWfnUpgW1RZBqu+
	 W/0UNy09r9KghL3s73k9oetoLYi3/2nD0UhceIyCuj01b57W2iAC3Ei0ds36kRDD+1yxF
	 2wTyolPMO3a8d5A3c2F9pDQaKyB1r0lrUgZ6kYQbYpb4GhawPfa1u2iSjrdjgtvSdt61C
	 28uHSmvO8fL12zbMaO2o6XeoOX8oFE0m1lDqmcqzB/y6+si4MV3RQIJaMFBsAwIKb3jZs
	 sxPowHd/VxrCQaBSmcKB1vokGzcrcTKolaSRgcZJLG23wfOiydTWsmOgkMxZg95b1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
	b=TMzp6I9tgWunHwJvuxfNhsFICzXqs+GmcjIPbiyF5YPaQasgPu995sxi6BJQOMJiH/mP
	 JFW/jAqQLE17Ph9BrDSaJ8W5+cLknY1sHdnqVQrNkZy7/8RvdTugVrfYKSSvTBBZIb1h3
	 6fXKkuh8OGe9fS5Vg7DtFDM5J3vbJJeJg1ZiFcV9nk+Nv+DNzdQr9v1vL8Y7ksUkJoTw9
	 fHTU/Ba/ygCFG019iLbK3TbtO0I13JEEsTJ89dkdeCy9XsmFm3FOg0Lqq7qUiaOVPuQ/Z
	 ZjBL/l4rqDpXtlrFlncRJUsHHci/wBGbnsYuaby6W6OWxPQGCNUBLK4nAQCfK7vSsVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciYKEnL6;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EC606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924EC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciYKEnL6
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f3c616c84so52413385a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978770; x=1795583570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
        b=ciYKEnL6tN9Cbe2SrzIAdyXmOVkWx5M2NSiY4dZnY12moQKFQUR8iU/6wgFRkSjd3v
         JQ5VbASNb+PFxxdbJ5S69gN2OjKr17CnQ3SlsNgqN1FfMX72q7o79JmRrefAWAL7NP0/
         xr960MjUqeO8dGSd9rbpWUZCmtaZh3prBsDFnHVPtWONMpWE0alVByPapHyi8oRg5AiK
         hobouqYTUKa3JlPjW1G3QVw+cvBoKTJRdZb7AJ85WYgHhqdNHcIXOo1NyLMbC9sKcfWF
         SC+bcg9Lp8z/w486uv2uH8efmGWbJROBSOy4trYcNoXgjA6ge6eiHO/gLgExg9AIvbOf
         q/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978770; x=1795583570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I/hVi6WR1uXMNLiaaICSMrOG3A3Cvvh+eTe+Y8iRDE=;
        b=X2vYWRZSI+aAUYe075itd46H1FzGbLqOOpFmCxQ13pHvkqoKnIpRkuLp59zvo1KQrf
         NHTG3vOPAhgbW4v+if9j9iCs8OCP/vFLvU2ri1MA3rqfjIYH+LtIPa/syF2fivqwarzT
         dr1vOFL5CPTENaf0hVMCEHE5bRls6ntQVmnFC88r7KXo617mOM3Gyt009l8s2dsjXcFH
         /WYuQ/LLvZqWfSMJsmoGf3K4rYEY2/V+v5EojVVSuU4RfI4bk0Xr9JoricxD09V/XJa+
         sRJmpj6JUTmCHo8MYw5r7QlsqkwrmChH1nQyPp++0I0Kbv5911Q+LVpjgN5yZvlQ4tV6
         Oj8A==
X-Forwarded-Encrypted: i=1; AL+hErEFK7npsD3//NyzFbwTF+m2YXzppd0ZGVN7vu5CfoJ94vWk533/z/4ZMsq9yJcU8GAKaKj+4tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WVsw4RoGCq+qz94C8E86r9FkHWMV95zP/fMvx4jRv6kH0WTpI
	3L7crjbWQSP7ADRzo09lrPuewoh1+g93/KpT3xgjuQYwB5xwikKFoWXD
X-Gm-Gg: AYBFou1+fmLzFCvjAgNT8QOJzvnGjXPmGkMrKEdSFA956T1rkOhdaKV+R13gYUyXVeA
	O1X7tj2UDMqf9xRFDvODOmYGNZYo5hfOS8PjCK/kmiiXqcYLQBOKQE3ojvnkFdmTAyo6BvObOQJ
	NMPnF2mIMJqMI2N4dQdfvPUuiKfzUHAEX7uD58hZcbZ5ccYupiskFEhxq9aE/aFEcv+lhM3C8QJ
	0jeb3Uimx/GSUXk2bS0uI+hVFyihwHAmFCWNnuK+QyjWoZg8ipwYYLCQ6jI5IiW5hAIRyYsY25x
	Ku2NSyXLt3UUBy7FZ2unFGMKjbmqDEDUgVsDTHCfr3c1aXkONPskbAAMHlQ+L3gg/TBrb/Wt/yI
	dllXXfhD0KXhGxtDaYC+Ax39KhNltqCQGXNah0WlrmJYKQz3T+IPq0JLzsK2DRE3G2uXXkAlqiT
	t1/zhYrNezYnZ/uEhKax3BehxRPULtoMTPPXPCbzLXvVu+lVh7IkCx8A9RIgpxfio+zjRqAeSN9
	QSjkYAyzXyadNbTI+flS/OTDUqnawCy7yZsOECyuhGnMxh7nYIXAfEu8BwhHBGhlrL10xNPPWnH
	Z8M6jQdAX1rGDnRArwPFdwYWRzMYIiUoem++n8nC4DOBj0zPScncFk/H1sopQ5Q9/QozY6/0C+k
	=
X-Received: by 2002:a05:620a:2718:b0:949:7781:6a31 with SMTP id af79cd13be357-9499962736dmr286507385a.76.1794978770597;
        Tue, 17 Nov 2026 21:12:50 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm95547485a.31.2026.11.17.21.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:12:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jianbo Liu <jianbol@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5e: IPsec, Fix RX mapped ID leak when adding a rule fails
Date: Wed, 18 Nov 2026 00:12:47 -0500
Message-ID: <20261118051247.3885308-1-lcy8047@gmail.com>
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

In switchdev mode, rx_add_rule() calls
mlx5_esw_ipsec_rx_setup_modify_header(), which allocates a mapped ID for
the SA in ipsec->ipsec_obj_id_map. If a later step fails, the error path
frees the modify header but leaves the ID in the XArray, and
mlx5e_xfrm_add_state() then frees the SA entry. Each failed inbound
packet offload SA leaks one of the 2047 IDs. Once they are used up, no
new inbound SA can be offloaded until the IPsec context is cleaned up.

Remove the mapping where the modify header is freed, as
mlx5e_accel_ipsec_fs_del_rule() does. The modify header is set only after
a new ID was allocated, so the copy that mlx5e_accel_ipsec_fs_modify()
passes in never loses the ID of the original SA. Outside switchdev mode
rx_mapped_id is 0 and the call does nothing.

Fixes: 91bafc638ed4 ("net/mlx5e: Handle IPsec offload for RX datapath in switchdev mode")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN, MLX5_ESWITCH,
MLX5_EN_IPSEC and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
index 5c69e89b13a7..ef858374ae11 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec_fs.c
@@ -2161,8 +2161,10 @@ static int rx_add_rule(struct mlx5e_ipsec_sa_entry *sa_entry)
 	if (flow_act.pkt_reformat)
 		mlx5_packet_reformat_dealloc(mdev, flow_act.pkt_reformat);
 err_pkt_reformat:
-	if (flow_act.modify_hdr)
+	if (flow_act.modify_hdr) {
 		mlx5_modify_header_dealloc(mdev, flow_act.modify_hdr);
+		mlx5_esw_ipsec_rx_id_mapping_remove(sa_entry);
+	}
 err_mod_header:
 	kvfree(spec);
 err_alloc:

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.43.0

