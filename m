Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532725;
	b=YopzZTnzf7SrjEr9w25nX3zD99HV7KRzTvuOYzUdDmLYGvtdCkHlyg4U5a5oIU9yDi64
	 2rhHxjzmjU/asvzlbPGYdZ5PGNwTMP/UMXnR0K+kMuvuh5V3Dh/mhHjHWojm+y+jfiFZ3
	 yJObfYRdYp3P4PQKdmsqUZ+/ab4qPWg9ZrcpmPawOSkNA4mTHOeXF9OW2cVvkQR5r9Dv+
	 p3mtkkU2JBdOPkm6+j6qonui/0hep7liTMggzCDJaTW1WMZcUsQq00Ttwl8ZyuW0jYXwe
	 gpdu122+hcaMIujpw2HNnxKMfdjnKgXBa6euhQ2syMv4lJw/w25HfrITYDU1z/u1Fng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9kRZ+ZH4LdMBWC6ve/Az3ANmhhc0zTDCEND6X4yuJN8=;
	b=ws4eW3Riz9TxtG4gFk9WWyjuZMfjcamYz8ikOQPYAXSU7+a35GC4QSNCaEFaWm9BhUlb
	 S7/8S0Oz3h8p9pyhnP4Q+tinTtBNurfjJ5OhBNh07TUvPDcVsKJEn28YntffAMiycMwbf
	 SEVKy0vA+RpCLBKkdwVMU/JXgtLN3j9JyXS0WMx2IZ0Yp9h2JVNH9D/Ar+sIBCC3W6Spf
	 PXUNPqiaYF6AxJZEyB0orWDEWIREc1M2lM8+XBqtEjnI07/pHH1GpA7MyWvRGnx6wY84H
	 160HgPSa07CqIUZviGwxJ8tR19hvYZNkPw0QKq5sWoYfXeiSrUZGRBIypPoou9Smvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK9omyFW;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B3606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK9omyFW
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso3092101b3a.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532724; x=1796137524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kRZ+ZH4LdMBWC6ve/Az3ANmhhc0zTDCEND6X4yuJN8=;
        b=iK9omyFWI4tDcuTj6/x144HUnk2WeIjyJG4cPwusxsYJ99SG+fHO/Bh2ebDxyZl5xU
         fMhOVY03U2Gju8oRMcDuC5CtENTyj3/s4cpWPGKhD050/Vf7b3kZSn9CIGl9kQEjtqGD
         oF5hdIWLv1l+5C9rKzLOCjPqrN153qzWbvsXJr1T9h6d7ysJvhMKZCgOAA5ikjU2w+G1
         ePD3LwXNAGNLLlXVBohc1cDEFHqTlHIOcIYkBRt/8eLn/mYpZMgjDhP/Ov49I2G2qeoV
         yKn+zmhrV5neSq93qGgE/EklJ7Sd5yzU+jh6vIk7tskjRbYaPKuCXxev6P48Dzylj1TU
         ydFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532724; x=1796137524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kRZ+ZH4LdMBWC6ve/Az3ANmhhc0zTDCEND6X4yuJN8=;
        b=V7PrZXzxqs5MWVUjrzPJbeEfdBsQgFtXatzycUTA27E3+RHZME+UMG58ITzOpjq69f
         u++1mcz8S1ShtvZBCGUmHdLFYf/OhJBJa0AO0TN7BV37L+S57oHan7AxX0viK/bRoRMn
         FCYS/S/OGNPVu6/sOBx/7RX4yKbRWLjjaXOHqKgcoFw5b+5JwXFQ5HiYdw8gnZkze8EY
         qEtbnbYClOhQsvrjKYbpYyE8J4/eTNe2SjiTyb1+2B6lAioL+pc4UFD5ENAz6sa7oZbX
         kWf+8PvBtA8/18LKohx8ZjUj4JgyPXOVogODW4XW1gvEKchCA8IQeg7Ym/nYWuUOfi99
         zodw==
X-Gm-Message-State: APuU4Z9F4+okSD0vB7YjhSU7dW5kMDuEBvWty/2BUM/EgqBJihP1IKjR
	v2vs6BTw4iocdZNa2SfFBRQ/zGhi7OkPaPFhsBj5nx0rzUijtOANIdjc3u/fYuLa
X-Gm-Gg: AZFdTZfRaJIHPqyzCRXKrFjcIqnUZWJ9JRfa/M9QOQUDDkZ0UBIxQmtKXE5VpOSK7XH
	TX6b1+SMlqdEs07QLxXPJ2os80G+fhumeCwnkcgabov139QrSh9U2Ke0Q/4PxC6xBUqsuGHwwSK
	OCNfC9tg3r6iJcOyef7EQPUqN36fZ3b3aCf51/xl0yjFtsHzElVsj6vTwGrWvfCp0O33fj45Cyw
	UYfgzH3p0oyDpGQdMNve+yktrrcL8wGDKeHmCipNOKP5uN25UEIJQF1cz/qS2zhL8dqY0sr1pWQ
	TJUx4m3fXqu4xIxUmxNWR3RCr4dSdh3LG5bjlwM6NsRXEg29NYeDF9McZ9RQNLZvyG+Y0b+PTmL
	ozpevQQyL978SFk98XW7z5K6CIECZdsXnIPIbDOnjdsCgGRecRVGD4PSK8VjiV3I7ez8igBVdhT
	D7AmVMR0N12G1lnTCfLlqZ43a2H/ByNWjjczKfGSi91sBn2oyJKkn2r+bzpk6LhQV2NxfHAhv3x
	0yWfKBRIbabfRxuSokESyKwEqbyIHO2TeoIDeSFTpYZCx5bKwE57Cj0pbzgx9F910LL+2urT1v5
	Kfuf8MoD0x3zeuidqx3jWJMPrVpwvvN+nQXnXivemNvx2arGAAH/zGjg8xZY1sfNX1/P6ZSDnwQ
	=
X-Received: by 2002:a05:6a00:b90:b0:8b6:ca80:1ade with SMTP id d2e1a72fcca58-8c7dea69446mr10370274b3a.48.1795532724271;
        Tue, 24 Nov 2026 07:05:24 -0800 (PST)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm7377372b3a.11.2026.11.24.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:05:23 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: netdev@vger.kernel.org
Cc: Jason@zx2c4.com,
	wireguard@lists.zx2c4.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	syzbot+434045ea68296f3f0219@syzkaller.appspotmail.com
Subject: [PATCH net] wireguard: peerlookup: avoid redundant peer pointer store
Date: Tue, 24 Nov 2026 23:05:16 +0800
Message-ID: <20261124150517.565-1-viennaoffh@gmail.com>
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

syzbot reported a KCSAN data race between
wg_index_hashtable_lookup() and wg_packet_decrypt_worker().

wg_index_hashtable_lookup() obtains a reference to entry->peer, then
writes the reference back to entry->peer. The peer pointer is set when
the index entry is initialized; the lookup does not need to modify it.
Packet workers read this field concurrently, so the redundant store
triggers the KCSAN report.

Keep the acquired reference in a local variable and return it through
the peer output parameter instead.

Testing:
- Built x86_64 with CONFIG_KCSAN=y and CONFIG_KCSAN_EARLY_ENABLE=y.
  CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY and
  CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC were unset.
- Ran a 120-second local QEMU stress test with bidirectional UDP traffic
  over two WireGuard network namespaces. Four iperf3 ports with -P 8
  generated 32 streams per direction (64 total). The baseline reported
  39 races involving wg_packet_decrypt_worker and 115 reports involving
  wg_index_hashtable_lookup overall. The patched kernel reported none
  involving wg_index_hashtable_lookup. Both runs completed successfully;
  unrelated KCSAN reports remained in the patched run.
- The upstream WireGuard QEMU selftest suite was not rerun with this
  exact KCSAN configuration.

Reported-by: syzbot+434045ea68296f3f0219@syzkaller.appspotmail.com
Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Closes: https://syzkaller.appspot.com/bug?extid=434045ea68296f3f0219
Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>
---
 drivers/net/wireguard/peerlookup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireguard/peerlookup.c b/drivers/net/wireguard/peerlookup.c
index 99651a86ac953..6c8d41f12cc6d 100644
--- a/drivers/net/wireguard/peerlookup.c
+++ b/drivers/net/wireguard/peerlookup.c
@@ -204,6 +204,7 @@ wg_index_hashtable_lookup(struct index_hashtable *table,
 			  const __le32 index, struct wg_peer **peer)
 {
 	struct index_hashtable_entry *iter_entry, *entry = NULL;
+	struct wg_peer *peer_ref;
 
 	rcu_read_lock_bh();
 	hlist_for_each_entry_rcu_bh(iter_entry, index_bucket(table, index),
@@ -215,9 +216,9 @@ wg_index_hashtable_lookup(struct index_hashtable *table,
 		}
 	}
 	if (likely(entry)) {
-		entry->peer = wg_peer_get_maybe_zero(entry->peer);
-		if (likely(entry->peer))
-			*peer = entry->peer;
+		peer_ref = wg_peer_get_maybe_zero(entry->peer);
+		if (likely(peer_ref))
+			*peer = peer_ref;
 		else
 			entry = NULL;
 	}
