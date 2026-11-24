Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527142;
	b=aFbUsRll4qBsAb0AlSxUeUeSCtibIOqgEKsC1fErTnw1lY2+khgIuWKDc0nja6ww9RhR
	 ZwzRrKoCanK6LwOF8wEh8PIBakugKcmWHU/RAnKgr60OpmMdaZvWku1WVDa2DExJuT4Ss
	 K64ojyjOTHSpTo56ViBzFQO+g5EE4tm5xgV2hQvS1I3bkGjltdUwYPjRsqu9MQry4XCii
	 FdtSlNKaA7XGS8JMpqovqD4PQox5+YSVEghQ2ypm+g06B8WT7E4hkJ3kbVmsLlROqvX3p
	 sVfGrwB65t1LDE4JY4Yw+gD9mViLDhZIakVQlFLDVp4GDWbeXhnvnCzOUeLlo8CPc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FkB1rfhhWmgOmtcqcMrmpHX3R/poKCnBEiDUBHwxPN4=;
	b=s+VeXhUrIoOcMxSlynV4RLkZvRPpqqIwME4SgrTJyWAzHzfpWHzjbfsgUd90F2wnlvr3
	 nh+XXs9P8dsukRtaVxwededqdvHTGfzMHfv3lZgFjKb7OlVWt6xypbff8cM9wJcnesWF4
	 EwmgBfdeoT3EKkab85SUsKmHrzfjoeuSDySGZmhyK45eCUnqmr2Ktq4PTX1Sm5qsX7y4k
	 BcsGf2LD7isBlbA2IfWOvMsGTLjLhJEiezm6zTRb/4dHrAApr+ehKnn3AD9hjcDmT0Pf0
	 kogpBsDlFWIY3s2GzL6SQCdAhiqPais0MTygvPXp38zF2QFafbDnRudNo9GxWlP/gkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPzxkV5w;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7726A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPzxkV5w
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f046b0adc0so23458445ad.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527142; x=1796131942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FkB1rfhhWmgOmtcqcMrmpHX3R/poKCnBEiDUBHwxPN4=;
        b=BPzxkV5w4uxqa1mDpaV8KHfx8OgR9tN1vcRg0XlbqrozY6OykdlNVV7ThZ78gmEYGC
         D9NCWey9m4FrPWAXZ4jmRN8FWqKxPk7Vc0BGNBa1xri2Ptu2GbQwGDsGwlyxUDCNFZcI
         TL/tlxtrzZdq6eVdbnQQtCosAY5BgSP3ZjrE7pdE9nQUp/jSZqD5FOedytzyvXblJdR2
         mt/3Z4WhshR5w+ksf8WPiIIAog7F4lpmVMEcsRt8sTRCW5y9Pm2ETTgs3DbfVEhAXwYZ
         xL0a645cu4j0bE9ult/wiww3em+MPlFgOUv4m0O9+D6JmhpFznUpPYONSUNDRJsPpjTE
         1G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527142; x=1796131942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkB1rfhhWmgOmtcqcMrmpHX3R/poKCnBEiDUBHwxPN4=;
        b=f/KU9MdOW1Bk4EVbHlGX+85N5GlAmgB+IrKSLBIRPtpDEBj5CW3TGQc5nZmzwNJMyQ
         58ArI7MD5laSN1TrJNJMaGcPpWfBfQWi/79E+dWSVdSDDRQrvRBNoG1vIWucr3PDIx4o
         vjw1GcOTrzDOhzEqu4rhaZPpTZ8C3tYrxV251TB4ZVlC1sOWxb0kQXo4nUdNWc7yeJvs
         1vp5LfEkkUG1wE0YJ46sBxUyid0BpD/MwvMjlQGZp5MeWk/OgqDTQubuGaxew+gQeT4A
         zIA2SHccqmvy3PsNZJrtvSt/+eRnuEPreI7hg/bn/ZqwkAPEC4zS5t1pBC8FAnP3ZtpT
         TAVw==
X-Forwarded-Encrypted: i=1; AL+hErEDNsRbtMT9hbFMg8P8rQ3M1PhXGrGwyHb/3KETYJfV0WNYLXz6Yub6VmBcmUvNHlzOTv41LLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QPbCjdTSra7feIYaNgCT4IKpbg+geVHqjMAAwgNFz6ixSQ8K9
	orD8Hz4RTNHWz9w26CP85mbTuxdXk6/zC1rnWxiSY7AIqrgk3fqG4MBu
X-Gm-Gg: AZFdTZef4VGPxDjW11LwO4T8AYyZjJYeXvR9oW7/dO8AkvgtNzoS0H72LhxJNMfRzWy
	7+nKhX3aLgOCQE8EvgqbVGeaOfQyceCklVi1CSp3V2s4eIfnXesHWHS1oGsC9jk8HbFZ2JSRrbI
	sqNTdcONdC65MKO/MaH/tCWgWIHqHc/+NXt1+0Ank4xNb1FFawAd0KfrXDNiVOp21OEpb6BYtHe
	1RP55eE54wtdxmOhBnG5SBENahfMhekA8bCJv4C8qNotufOOvztNj0gtso6FQTNugdAJTyNt02g
	Vqftd4Xmq7mpYEXC+3+k/tngBFKC27aMGlejxP+iderGVSFxOk8FGFqMjT/MxJrmknTa3c6b9LO
	WaSJWjlQpE+nJPYl/KtLSDfycEU5BkbR3pmOBOpiOecLUXYMjBWLAM7aXvVG4PJoGsCG2HP6zwC
	s8GC3sBVXBVaZEqYVkDqtsXydQc+NeVMD1afj+aRb24HwCi0P48lzxmCHyBbJ9ahS/cNHwWq2Su
	V31WEJCBW8h+gebRybKA/yfcvY1aH2IPa+OrpcdbJPfy2w59Mwjxk2VmKcm1knD1EiLfeKHEoM2
	mL9iOO2z9Xw2j55T2fhfyUMqHvbQsGNw6gKM3l0Czx+7Q1YcwnbEwLoM5YVeGBbZEZQ=
X-Received: by 2002:a17:903:19cb:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2f03f16d710mr137744975ad.47.1795527141501;
        Tue, 24 Nov 2026 05:32:21 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm12094595ad.49.2026.11.24.05.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:32:20 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Tuong Lien <tuong.t.lien@dektech.com.au>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net
Subject: [PATCH net] tipc: compute the rekeying delay without wrapping
Date: Tue, 24 Nov 2026 22:32:16 +0900
Message-ID: <179552107131.1345245.11261172891282782083@gmail.com>
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

tipc_crypto_rekeying_sched() converts the rekeying interval, given in
minutes, to milliseconds in 32 bits:

	delay = (now) ? 0 : tx->rekeying_intv * 60 * 1000;

TIPC_NLA_NODE_REKEYING accepts any u32, so intervals of 71583 minutes
and more wrap. An interval of 134217728 minutes gives a delay of 0. The
TX rekeying work then requeues itself without delay, and while its new
key waits for a peer to take it, each run goes straight back to the
requeue: a kworker spins until the key is flushed or the interval is
changed.

Compute the delay in jiffies in 64 bits and cap it at MAX_JIFFY_OFFSET,
the largest delay msecs_to_jiffies() returns.

Fixes: 23700da29b83 ("tipc: add automatic rekeying for encryption key")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user with iproute2's tipc tool:

$ unshare -Urn sh -e <<'END'
tipc node set identity 1111111111111111
tipc node set key this_is_a_master_key master
tipc node set key rekeying 134217728
sleep 3
END

Without the patch, a kworker keeps one CPU busy until the namespace
goes away (about 300 ticks of system time in three seconds on a 2-CPU
VM, against 2 before the last command); with it, the system time stays
at the idle level.

The patch was written with LLM assistance; we reviewed and tested it.

 net/tipc/crypto.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index 4409bdb70fe9..ef08524ce2ca 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -2417,8 +2417,9 @@ void tipc_crypto_rekeying_sched(struct tipc_crypto *tx, bool changed,
 	}
 
 	if (tx->rekeying_intv || now) {
-		delay = (now) ? 0 : tx->rekeying_intv * 60 * 1000;
-		queue_delayed_work(tx->wq, &tx->work, msecs_to_jiffies(delay));
+		delay = now ? 0 : min_t(u64, (u64)tx->rekeying_intv * 60 * HZ,
+					MAX_JIFFY_OFFSET);
+		queue_delayed_work(tx->wq, &tx->work, delay);
 	}
 }
 
-- 
2.43.0

