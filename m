Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392566;
	b=KxEufdVu2JqVJFYuKa2H4LNX3URE4rBOdUe8isNcbQbgTPEGGen5vdyk0aSRfWyDSStW
	 QmbPx0HWBgo4UFtJPf+pTPjHkJjSIeITefsy7Mb8LReFOtbFisKMxXbS8jABkBQ0fO965
	 I7N5EZ3TqDPHLRR9MyGOPd+VOd6ZMtEtNDhbY5p+T294mJagSmqh0YzBFbe/IBQYivhyy
	 HKScBbB5cYOJndQ/+XV7hGQuie/W7Bf9ZU5wyUS5efR/u0nHALMABv8IPofo3WiSqxNBN
	 L26ERRFA1Cs54j5HOVJFNibyyrOywE3OFJxP3rQwv2d8kqgLTfP02vHIwSOOI1f8Bag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5oZfxZDZESOt7JOg36JOb5NoJDTCRqffJz0J5sNJMMI=;
	b=B5DIrstxiuhYbvaPTbHUwcEpJ4kl/irNxH4vfqpjdonEoP/daqi59w2Lz6392avED/yl
	 Ip7a5bmNOiLYCkacXdrZNwwbGDxOnE6S1NBtcpm1i4aeW367MAyFhKPb+3loxL1FYnGwJ
	 GykSgFIv2LjSsjIlFnBakd1Fak0xZjzOtnwZbepSSMNbYK1Qgbgmh5UpVg3Um9ILNTh2w
	 cTYOvYBr9oiChAHRCfiq/O9/ZGlcUiTphjatc98x2dAnWHwscbB2rIepg5tHg/LFe6/eB
	 kVzj4/PYMzJ7SkGl8yiPl88Q2A8f5r2L0J2svfnFQvAxVYJZZQAD0ns6/CA6mYNjvmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bO3Xvg/G";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAFD606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DAFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bO3Xvg/G
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so6049a91.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795392565; x=1795997365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5oZfxZDZESOt7JOg36JOb5NoJDTCRqffJz0J5sNJMMI=;
        b=bO3Xvg/GvXSBMOwAZWCHZ1tEYldoTL/n5xhnbPHDS3uQE7Sv8OQh4LJ6JYItRZAiXq
         XvMWlzkSxtPGXkZ9l71qN1dHqUb3fc+VqST8GHnFtZZqiOCeFNhbyoKkCxAJnNE67ZYL
         yCTXW4qcyGBGrntGyiasEEr077JUQQZnBLh9AE/QBfYhitZGWz2MHpNL4CQALeWsvyJE
         fZK2dxbkB8oPVUn7tbLVgYB+dkQ5E5AIFcS1pMibV5hpo5QyjEQtqL2bh/UYXkzA1wU2
         5HZvTnuuMHEnb9rsuwBO6rT0+e/EuKC2+iRhfKdWpSMXnCl/zBSp5z+vWqW91x44iKNP
         SKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795392565; x=1795997365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5oZfxZDZESOt7JOg36JOb5NoJDTCRqffJz0J5sNJMMI=;
        b=oLRgc28BbyZfEInhTO21azg67XRM6x8x7cTnBWSM+JwXFw2V1tMw0DFMojZDm6V/83
         zL7b+d0WeqVGGcnN51XUEifaJL5PqYopRgeWAQMIheg/xHKz2iVoXmXwaiIGXieEHaHk
         fAVhtpQq4QgrnFDX8fPzAfip507XhMtRSlSIavmYjUh4kxytEzuHMfPt+hTnD4t0N0+5
         RNcNaGj/96QwR5GF7BbdLMKH1dvNO9KNL4PWSOyiOcp2l5s5xKRKvf5L7wTKL5ik3nA8
         nWo4CpCgLRO5ztfzS+WUwXcCCZHMWvjHaLP+VXpL23pppdx9zL+fI9NXw0Z87d5Om36A
         ia6A==
X-Forwarded-Encrypted: i=1; AL+hErF/IW4ZwRLjgHt2e/0r4yB4mNNnmX6UUmGrb7zj2G2O1t38qapVoutz7KeFqXQJxdjZVHAxYrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JZ/7ViubHPT0g2iMVUSyKPuKMYAliqmjkqJhR57TKffY2umgk
	4VJAQk5Igoldq9zbRJIxhOKi0oO6kOxixoSXojVIQizJtoRsVnVVBpEJ
X-Gm-Gg: AZFdTZf3Y6aci9zgipe+p5ulBCxN2o8YtMtbwP8ys6yNL16mcvi/GR6SfBvpaZOfpQ8
	CgJkmLCzV2vKBkDuLoxe8UjqCNrUV4rqVtBy+hb5MUWFR+mI4MHjuWKvI8S3GjeLiGsb7y5Jy4v
	sTq//LK+z8KbeE40+r/j2GXFT7XLEbpbr2yWz/3rqWAYbw88rwY6RV7ejKbsUJ03AS3oTxl2co2
	3YjIeJf0p54gkWaP79pOOaAy+D/L7HnjFh9TSGV1PVdjPxr4F0plHZON+s4foNQCmziM3eXM37t
	/E1c+xhXoUAe8cNxbgAdr6GJaZxkGszzPZoduRAR1xrCm5WO0spbyBPiSYeIeX/+zum1nB+OfDx
	2RRVD7eFjBtSx3xFYJI+mi3ga3ll+/Y9PfhdVKq9NI9urTBmx/J+fjI/kPYZqkH1U6kmG9CpIsh
	rVdRCVo+AD+OStSbG3LY/fAlYmHpePnDaHuRlJUTlDJXR5O9kKuwN/nShjRmsyAq+njtT/3MaAo
	F8JiB5Uj2qw3MfzDq1wUglAwMzdqY/qeD3FhfbB76O8452Zy5N/27clUNvzR4kKCjV5wxOcHT78
	XiNB/9cY6b5bT5G7VS4+nAUpr1ji9K1y9cUaBmHQgv91Z8ZmmHcQqyWceR7GLi/Z
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr9327128a91.21.1795392564569;
        Sun, 22 Nov 2026 16:09:24 -0800 (PST)
Received: from gmail.com ([116.162.234.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm16532573a91.3.2026.11.22.16.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:09:24 -0800 (PST)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
	kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] can: j1939: fix null-ptr-deref in j1939_session_completed()
Date: Sun, 22 Nov 2026 18:09:16 -0600
Message-ID: <20261123000916.181439-1-fuchen.dust@gmail.com>
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

j1939_session_completed() distributes the reassembled message of a
receive session. It looks the message up at the offset named by the
last ETP.CM_DPO of the peer, session->pkt.dpo * 7, and passes the
result to j1939_sk_recv() without checking it.

j1939_xtp_rx_dpo_one() stores that DPO without any check. A receive
session keeps the whole message in a single skb, so a DPO with a
packet number >= session->pkt.total makes the lookup return NULL.
When the transfer then completes, j1939_sk_recv() dereferences the
NULL pointer and the kernel crashes in the receive path.

Any node on the CAN bus can send such a DPO, for example right before
the last data packet of an otherwise valid transfer, so this is
remotely triggerable. On a system with the vcan and J1939 modules
available, an unprivileged local user can reach it from inside a user
namespace as well.

Reject the DPO when it is received, and keep a backstop for the
lookup:

- Cancel a receive session with J1939_XTP_ABORT_BAD_EDPO_OFFSET when
  the DPO has a packet number >= session->pkt.total. That abort code
  existed but was never sent. Transmitter sessions are not affected,
  they only see the echo of their own DPO.
- Keep the NULL check in j1939_session_completed() and set
  session->err on that path, so that an unexpected lookup failure is
  reported as J1939_EE_INFO_RX_ABORT instead of ending as a success.

AI assistance was used to analyze the bug, and to prepare and test
this patch.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---

Notes (j1939-v2-submit):
    Based on mainline commit 4843f6873f7c4835e62f2c73ba0fd538e57a2f22.
    
    Changes since v1, following the Sashiko review:
    v1: https://lore.kernel.org/linux-can/20261117103516.535910-1-fuchen.dust@gmail.com
    review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117103516.535910-1-fuchen.dust%40gmail.com
    
    - v1 only added the NULL check. v2 also rejects the DPO in
      j1939_xtp_rx_dpo_one() and reports a failed lookup via
      session->err.
    - The commit message now states the impact and the reachability.
    - This patch supersedes my 2-patch series from September, which had
      the same NULL check and a DPO check limited to dpo > pkt.total:
      https://lore.kernel.org/linux-can/20260918025622.192582-1-m18335910246@163.com
    
    Testing, on v7.4-rc3 based kernels with CONFIG_KASAN=y, with raw CAN
    frames injected on a vcan interface:
    
    - Unpatched: an ETP receive session given a DPO with packet number 256
      for a 256 packet transfer, followed by the last data packet, causes
      "KASAN: null-ptr-deref in range [0x18-0x1f]" in j1939_sk_recv() and
      a panic. The same happens when an unprivileged user triggers it from
      inside a user namespace, with the modules auto-loaded on demand.
    - Patched: the kernel answers with ETP.CM_ABORT (reason 12), the
      socket gets J1939_EE_INFO_RX_ABORT, nothing is delivered and the
      kernel keeps running. Same for packet numbers 257 and 65535.
    - A valid transfer whose last DPO has packet number 255 completes on
      both kernels, the 1786 byte message arrives intact.
    - net/can/j1939/ builds without warnings with W=1.
    
    The reproducer is not included. It is available on request.

 net/can/j1939/transport.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f8..d3644c8239a4b 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1244,8 +1244,13 @@ static void j1939_session_completed(struct j1939_session *session)
 	if (!session->transmission) {
 		se_skb = j1939_session_skb_get(session);
 		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		if (se_skb) {
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		} else {
+			/* should not happen, report it instead of a success */
+			session->err = EPROTO;
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);
@@ -1823,14 +1828,25 @@ static void j1939_xtp_rx_dpo_one(struct j1939_session *session,
 				 struct sk_buff *skb)
 {
 	const u8 *dat = skb->data;
+	unsigned int dpo;
 
 	if (j1939_xtp_rx_cmd_bad_pgn(session, skb))
 		return;
 
 	netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
 
+	dpo = j1939_etp_ctl_to_packet(skb->data);
+	/* a receive session keeps the whole message in a single skb,
+	 * reject a DPO which does not point into it
+	 */
+	if (!session->transmission && dpo >= session->pkt.total) {
+		j1939_session_timers_cancel(session);
+		j1939_session_cancel(session, J1939_XTP_ABORT_BAD_EDPO_OFFSET);
+		return;
+	}
+
 	/* transmitted without problems */
-	session->pkt.dpo = j1939_etp_ctl_to_packet(skb->data);
+	session->pkt.dpo = dpo;
 	session->last_cmd = dat[0];
 	j1939_tp_set_rxtimeout(session, 750);
 

base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
