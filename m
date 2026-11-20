Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188524;
	b=twxauEEr/JB8qPTzEapmlcyOrh/3H87OCa8zm7yDObovPncM1ARa4GK4F1zumL50fGBa
	 f0pZCUJgXzujx+/nn1wc4z6P3IIWgVZgtw45lLsp19NPKYcFPnNP+0tOm/nK1xsCaqr4p
	 kd8oM7cQoQ/RGRXWwbiz3SC6SPO6MKRpHKNVYmW0D0Uep7Xj9slY4+uJL/+k2x0sh+0S6
	 TIdpnRN4aRO40rRIOMXPUtKezYkVJ/5Zd4nqmE91bXwXmIHLSE7J6VG0pY7jBzRTRbINJ
	 rypoAXd7lz0RDBc5j/cYuEioADPcDNzjEJMpUPngyuX8XUa/W/brGWYsOJsOsN5LgqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
	b=FTEC+qG0lkBDvTNssUR9N2oVjS9DuyXJPuLu1srmQEv/Taq/c62i5izhj1ff1S1upayj
	 PA9g0+wmnGstb8kfiFuurBAEIPqgiP1FGsRktElrsgOZpTnGFad5Fyf3WtaEdy0Vl2uxP
	 GHoa92OQAhDTLwVtP88dlndW1kFTUAhMhO25Qo/Kli3qhpxT5axVcX/NDAoVF3irdmmtc
	 nbgsLGk6jbnHcRWkW5GqBFxLisldY+DfyKe7NzBw4QiL3R1GW/U+/dLiF6lRRNao7+PX6
	 3ohI5sR7nIpfDs5mKyWiShtTTI9sPDqyUKLNEAC4sqS8VK6t/EPGCPzMx09gwJjefEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m7gqa9dx;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F2606A330
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313F2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m7gqa9dx
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so425633b3a.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188524; x=1795793324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
        b=m7gqa9dxsiq/A84tMNHqF4JVUM1Oo42ZflJMzKIecgIJsF75DBOCzd3XyWaMiSm95H
         qHlSzwn2zZL+eW1qMmOfAZ+qBqIPI3iIRxjh4IjLf11qBLiiMeKobi9JQD0s7AloIRMp
         FnBYgJX+E0iFaxg+Uqr2fA0Yz/ErwlL1GTZ8IBbeVKZkvvUCpbjJJmBwQh32VtNGIpzX
         ZYW4jSjvmPawTrzZk7w7t5XM5UNAdjJVS5c+VSwmBAbiaORw3Fpm/vHbMBy3NHof7ehR
         3fnsRWjRQSz42f9uA5eJQC11F7PXukzF3KRJQkl8ta55w24PlGPAPqSi1sNXrMKLSCoJ
         FunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188524; x=1795793324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
        b=Uo2UxPF/xejfU/bKC1ozgctu0j1olUTZCihK8Uyyj9yGgG1xpAcLWgwNTutVh0ikGo
         68C4meTCtBp8fuoCwM0+gT8riTgTB9y6lM5eAi5dyBoAY+TXhK0aNWw5DqxPsglVSrUK
         2cn/UhNpY6Gs6p+6gmUks3sR4JYkponnXa60XVaI7rk+k4Iw+uu3oyrEUm3f2GP3Dfdl
         WLRV5JL5aqJc/Amt3paIfEcXEwZup+gd1pTMXn4kfFd90QZVpNU6duc20Ulit/3SWvMD
         oZt2weRUYgva9Q725hbAowPHOQUWacdoWtwvo8uLQDh3weLbpSQV29OZTKKUD+d5vXvj
         IAdA==
X-Gm-Message-State: APuU4Z+qvGfnF4YoO5dAq+pt0zp7kcbxh6Rkh7PlJ28zvuL1+8wXD1Z1
	PMeP53fQkqTZ0ZFBQNeN8WXH6oNKzFMaxy47zE3rP+bdy8+aoaKDEAz5LilW6tzMAWDEJeL8ElX
	ODnoC
X-Gm-Gg: AZFdTZefAPR1dyZcQcnx0oAMgoxOgjKQWx2zfhb0sfmp0/bqKlrusWU+G8wCH2OmndQ
	ODgTvUpiKR90/UdQhayK4bQLy84/RfgAqDv4l/+G4116K4gU9C1I4JF4R+4u1Bvc+dYJ1qMllA4
	Vdgk6XJHviGnMn46CFwOXGRwEB20nkw/B0Mz5s8dAYmHqDCOg0ScwsUh2DlAsVrAFWGcpJHdlF7
	FsLMTkGNeirRs7Cs/qf32Yn+xsmTh41pUDuP3U4v46+6c+7c/ZcJgwwO23UMvPiMlMgvum1VjQq
	we00iRWwZAnfVjR+sNXHozrcnU1O042KlYiktqOo76fHMAXOMCiCODB2+rx7/xUy3m1sf5iriDS
	Q7WGHqT2MQFRqJDuPn9sbFlKewYS+unmE1BPZ+f8tYL85f7Bj0wA2aYQBVauT6QWn8vH8dX3QOE
	sbSq0nKK9TsdMudxKteao5/bcfozpP+OLL/vjaBzUcYC5r5DXkzGBHuIPs6x9LB3qmL/NUBX0u5
	cwcA65ZkyFgEJtNBoxwmoqJaVwMWkO2kInJd4ik4SvK8N21Uc/CourNQ4gCOoL0m5cB0n50gRLQ
	uRO+Anccd5ur0RHvlqDamYclu60oUfZH1/CKjgTQ0pw=
X-Received: by 2002:a05:6a00:1ac9:b0:874:705d:f65d with SMTP id d2e1a72fcca58-8c87cf2ad20mr3193643b3a.43.1795188523647;
        Fri, 20 Nov 2026 07:28:43 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm1637924b3a.32.2026.11.20.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:42 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion never arrives
Date: Fri, 20 Nov 2026 07:28:24 -0800
Message-ID: <20261120152830.699712-3-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
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

When HWRM_RING_FREE is sent over a completion ring, __hwrm_send() waits
for NAPI to consume the completion and gives up if it never arrives,
without looking at the response.

If a completion is not posted within the timeout, check the response
before giving up. If resp_len is set, the sequence id matches, and the
valid byte is set then the firmware completed the command and only the
notification was lost. Fall through to the normal error_code handling in
that case.

This check runs only after the full command timeout. A response that is
still being written reads a zero valid byte, so the command is still
treated as failed. The rest of the response is read only after the valid
byte has been seen.

Log the response state on both paths so there is more data when this rare
event occurs.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 47 +++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
index de02d1baa751..53667c0c38aa 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 		}
 
 		if (READ_ONCE(token->state) != BNXT_HWRM_COMPLETE) {
-			hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
-				 req_type);
-			goto exit;
+			__le16 resp_seq_id;
+			u8 valid_byte = 0;
+
+			/* Only HWRM_RING_FREE checks the response here. The
+			 * other users of a completion ring depend on the
+			 * completion itself: the IRQ self test, and
+			 * HWRM_RING_RESET, which reuses the ring. A cancelled
+			 * wait means the device is being torn down.
+			 */
+			if (req_type != HWRM_RING_FREE ||
+			    READ_ONCE(token->state) == BNXT_HWRM_CANCELLED) {
+				hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
+					 req_type);
+				goto exit;
+			}
+
+			/* The completion was not delivered, but the firmware
+			 * may still have freed the ring. Check the response
+			 * before giving up and log the state.
+			 */
+			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+			if (len && resp_seq_id == ctx->req->seq_id)
+				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
+
+			if (!valid_byte) {
+				hwrm_err(bp, ctx,
+					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
+					 req_type, len,
+					 le16_to_cpu(resp_seq_id),
+					 le16_to_cpu(ctx->req->seq_id));
+				goto exit;
+			}
+
+			/* Read the rest of the response after the valid byte */
+			dma_rmb();
+			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
+				netdev_warn(bp->dev,
+					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
+					    req_type, len, valid_byte,
+					    le16_to_cpu(ctx->resp->error_code));
+		} else {
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		}
-		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		valid = ((u8 *)ctx->resp) + len - 1;
 	} else {
 		__le16 seen_out_of_seq = ctx->req->seq_id; /* will never see */
-- 
2.53.1-Meta

