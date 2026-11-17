Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885225;
	b=4Mj4AW3OlU5XdLvCqMV1SsasaRm2BXJ9pm9bnozGIozEw/Vaxoh7wP/gpHpI5xxuTdQK
	 3NTOIfJPPjGGz/pQyRN1U1B8h+oaEWxg7/kYMwwL7b2DTQOAXRTJLnw7C98R40mZuF1Ht
	 x+k8ocWgSWvLbL/1gNhUfX/Vd9RG9dlk9EgUZPPuHpcw5MoyUWK3+G8yDEYcJN2N7WdDv
	 2cq8JvbeAS/ZNclRUToV9NmyC3ITY4CMQ/6iPncFm7sOAAq2Gk8Oxppl9PFZwXUilCGeh
	 +JtTMxv8hWjbHF0kp27tAY4Hb+YXg7IrDYizqnalMh6/WOjKY8Yo5A2ucUggXLm+bMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
	b=4MgqIXV349wcDm/w8dcwG/TZTPhg0/ZbAQrQPnbsh0Lu4rpY4lI3jxDTUA4qCtZvmVMH
	 iiBAmXXoCDwku7tvcGO5bcub+xLqeWXDfpXfrjrlCtVVQg0nAZfzjGjXg6YRpT4lC26gs
	 IxLBfLI8ranZ4XvYSGFhjMQhyYuKWBSdSJfOLkhvcpp/NzWWDcuFPxejwQ8YptEWUFCKL
	 qy3qhYZkU9dbV4gzn2mUH8xWSomxaavYX3WSJdJlX0T46zZJWMx1XkDSkapHF7TATiRuX
	 0c5ss/KFm/iQolQrpB5lfOks80XoDWTlS2xwAedgH/8CbQf2wS7oY9zMkVjJaRWbCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xwea8SFy;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC94606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC94606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xwea8SFy
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so15707895e9.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885223; x=1795490023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
        b=Xwea8SFy6dq5YCx5TnEg7s7TjmKn3RqF93jEzkLGdlrO/9brrztpFdqVI3zCuA2abY
         C5ZcxrPW/egan/vtln8DA0VBQlou9hrZBAyZHLFcWYuyX9KsdoD+pQbqnKbil+FjArIi
         aqtPjSm30s9kVsKnV2dKjb1Ce7+Mj0IlHxRGwxrr4WxdzIvIGKNH9k5zl72mHlHnFqe0
         GhGESNLta3lH4dTV8UWrxy6AwyRgXwLnhrU21mlZ8fgFoRoviHfDHzX2M0jiyU2tsbDk
         9hJuHyoF8n4g3rEueOuAWyxSKEcJGFoUQ11d37hOSr7K2dN0YPG6t+2ggkkwkE+ygnVU
         26TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885223; x=1795490023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IY0HuO3BnkQdngef+fmsiBdbRJiCtWyfl5JCFdKbRHA=;
        b=keu8/wTZuBDr4YjKo6XVAaNrAD15feAOUrQk9TFaGywWUJ+SMM84n6pH6OCFozIYSx
         d3Tld2II8j1xtFkN9bsOc2WPAy0i5E9O2nLdvwRzzALeQHxn2u5sg2DubWmj7tUqUHzQ
         5Nybw3KU4qPyB7Wqi32wVd13U/XAYkMso+vqRAZr09VOucX8IewWTqxbovfhbsG43Iiu
         P23E1u1tYZ1a2Nno9CzjnDz6eSkahCWQsGHYDZmZq2dodEVZEK+p565xBoNW5N8rrqgx
         yIvZ7EKwnEaQ0Hp6g+zdAgeP0Qd07RVtbcThg4p/oO++upo/62758WmI/klPsd7CSraw
         PgIQ==
X-Gm-Message-State: APuU4Z9dAf9YqVXPOO2P+6HZ+pVclyq9jZbcMx1K2rblYTwNdSDxJHGn
	xupUh147qQe2Ix9lxc8W1wul+ALxgNnOnGiulokGbr0YLqRvB6UVB3yQjBf0tkgY
X-Gm-Gg: AYBFou2cavIDqijZLACt8AHbwNAMncrF9IZn0AgLLgPi+RKSUAXxA8DCzkK1IxPpvaX
	7oM0AJITAYhcuRY/anVGBLo3FSSJ2JKvvXGQkdHqQueIvlB0wytILT1Sr9ZkOba22kQ1BGtwUzM
	PtQklxfQCB1daIWkTJCF2DW8B0zYctVu7cEzPRYYtj7zuT3AUFP4JVrSClgyzwGfEVwbpMR6Mlh
	0eTF0HgvQCaz2Y7wtXKQckeOhJoguPDBNf6GjSav5SvM2Rx84y2IRyRrG9QmjgCxi27mj/nZRlJ
	GDcHW9MDiOsVvjEBqda2Iq/1cr5s6jaz5n9sBj/olvQCK816Amuj6+Inb3GRFgLNd3CaYEKMUe/
	dERQ6HTswU3eTZzutZQHnx2eScFI6/msniVlRBzsAc+jtwPQweJ/AQvsxEdQqD3Eqsx/X9HzB/A
	z30obie0bwONNLL9r1MJVh1taOeFex7VkoBWysfsP6zg5xL0565XEakehtcW8g8s73PCBAwX7y5
	W+r6qEN2WWjQN7ZQlscn1aYzNCbp4Qdj/y0gl7kX45mty0IZ25FSWXUkDVhjB7yv9laBigh3ux7
	7neIvBlPeG7vFAz1mq9KEU38M8cFM0TDp3BAWnVF7w1blHER
X-Received: by 2002:a05:600c:1912:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb6375ab25mr186448935e9.27.1794885223384;
        Mon, 16 Nov 2026 19:13:43 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:41::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm25876743f8f.56.2026.11.16.19.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:13:41 -0800 (PST)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	cjubran@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: mlx5: Allow police as the last action of a TC rule
Date: Mon, 16 Nov 2026 19:13:37 -0800
Message-ID: <20261117031337.4126403-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.1
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

From: Mohsin Bashir <hmohsin@meta.com>

In switchdev mode, mlx5 offloads police only when other actions follow
it. TC needs no extra action for a police-only rule to work. The mlx5
driver makes every police rule forward to the post meter table, but for
a rate police it adds that forward only after verify_attr_actions() has
checked the rule, so the check rejects it. The ok result of police is
also handled as pipe. In TC, ok accepts the packet and ends the action
list, whereas mlx5 goes on with the actions after police.

Support police as the only action of a rule. Set the forward while
parsing police, as is already done for police with mtu, and forward
an ok result to the end of the TC chains, as the driver does when it
offloads the gact ok action. The upcoming selftest series also relies on
such rules for TC offload validation.

The patch was tested on a ConnectX-7 in switchdev mode with the command
below, and it was verified that the rule is offloaded and limits the
matching traffic to the configured rate, using the hardware drop counter.

  tc filter add dev eth0 ingress pref 100 protocol ipv6 flower skip_sw \
    ip_proto udp dst_port 5201 \
    action police rate 100mbit burst 1m conform-exceed drop/ok

Cc: Carolina Jubran <cjubran@nvidia.com>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c | 3 ++-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c            | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
index 1bd1c94fb977..52295f5d644c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/police.c
@@ -94,13 +94,14 @@ tc_act_parse_police(struct mlx5e_tc_act_parse_state *parse_state,
 		      MLX5_FLOW_STEERING_CAP_MATCH_RANGES))
 			return -EOPNOTSUPP;
 
-		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
 		attr->flags |= MLX5_ATTR_FLAG_MTU;
 	} else {
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_EXECUTE_ASO;
 		attr->exe_aso_type = MLX5_EXE_ASO_FLOW_METER;
 	}
 
+	attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..8685e41487f3 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3892,6 +3892,9 @@ alloc_branch_attr(struct mlx5e_tc_flow *flow,
 		attr->action |= MLX5_FLOW_CONTEXT_ACTION_DROP;
 		break;
 	case FLOW_ACTION_ACCEPT:
+		attr->action |= MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
+		attr->flags |= MLX5_ATTR_FLAG_ACCEPT;
+		break;
 	case FLOW_ACTION_PIPE:
 		err = set_branch_dest_ft(flow->priv, attr);
 		if (err)
-- 
2.53.1-Meta

