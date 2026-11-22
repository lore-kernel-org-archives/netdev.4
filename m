Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368828;
	b=IC9oswP2lI2Da7KgoEz6/cF6cjSBEKQ38EeRpfjZUHKGaZMulOIpBXIx+2CbJSpMEM5l
	 GZFRin8LHd4d8RdZlfOHXEwERrlygWrsTvUqL8fCjTi3H3sQSMSgw/VHg6zJcOILpms0Q
	 YWQpv/shYz3eS0nieBLwVlC0FqIiloAdDh+CWvcqgMbIJJMEZcHCA6lfDWhQHGRXeQAxq
	 IJBanbeQkfoxPk6aPTtSrw/EZ+coLvre4iouSYXHpMyy7r5j33+5EEgK7l/VoMbmTyLef
	 FXVJA4tckzd2MMGHNtgFBwY2o+QCnYSQfNkNiHt7l3XgFqjVdfgXKlADKawEAiW7Vhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0wBhVLTOMJhdiy998cb8V6v4J1DUca/LT9un/0P5QXs=;
	b=j3JAlQmnoeXUDm6v7mgMqJN6qAVpkOtyxjLwz/mfPNDyyc+dPJ1GQgaAKQsS092uzocy
	 VOl4mX8M5P2+rz1y8Lej2Wj4dCIwD4mSjmDZwV607kPjNh/y/hGp6l7zAKX+fbvHf7xap
	 j9x90ExiE8GZx7kiaKYOwZwQYc7ZKj9p9gPUlWeWIEAFkEPPShSW9xyAR3rmJUbs2Hxm8
	 3epza7/Fh3Z+Q6L2xZk+Z3ERcBiB1qMbmuHrBtoSH2DX0cLgepmq4sTfMm2N11WPhT7ob
	 J9BfsqO8+mprxs72PkcCNvsYW7oZmCl0jIWqH7Q+YQvXEMOYeH3BYlg+gaoTRYKMiYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=t6230Lsd;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD47606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD47606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=t6230Lsd
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so2833771a12.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795368827; x=1795973627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wBhVLTOMJhdiy998cb8V6v4J1DUca/LT9un/0P5QXs=;
        b=t6230Lsd3zmCuZhLTeeetXleCgbF9ZthGlhjej0z0CuSf7EabUhionEMXXgkyNWmUb
         RCx/0bROpFHJIUzM14Rk/4W6NJuca7bVVE6VuCsF4u09U90EWAs+6R6ePkZiUYMgwijU
         /FMxVY4gV1oqWf+UmyPWQPrwVmJYGu9dB8u9JGNbOq8YRsoElkFHVmmner1IwrqqT2Ha
         48yucXth8nbEKG+XU+J9CMPmCvHP7Whtu2ncTiYGo16Kgm8TxaBifjAZjhgoop1T56fh
         mgIXa5t4GCp20DlfEFVzm2AOvAOcA3E6+DcUnyWfrBLBqIlulDja8VzkD8d7GeX+X2hz
         N4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368827; x=1795973627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wBhVLTOMJhdiy998cb8V6v4J1DUca/LT9un/0P5QXs=;
        b=CSCj2SlpcoOnhGF7to3M6A4X9oasNWRMsS53wd8DUK7QHLotEfUC5heAPNDgttTKU8
         chn7DQRkU5pH/DHt3Z7g0CRVup7fqGzpms56KTPIpSdvtK9TSLQr8PH/Xz+kn1ctKMs4
         nzkuzq2axQIJ/XrtMBMm+0nBLve9/7PJG8yJfDBmTT2uLZGMWte3ovj1lG6Aq7Edyhdj
         GT9wWPA36YuSmwBivaBNx6V4xdkvGzCr8XRYKM/nyI9MdhwoIo5QqnJYiNdC+xzS0wNS
         YCHLCUog+vflv9Rp6qwnTl5DpACnfVi9ubodTUu7qT2r3oAmgGZY8XbmsbjzS02cbskW
         aJQw==
X-Forwarded-Encrypted: i=1; AL+hErFDE/40gOd/muiCjnVXSNu+4S1kJaL1u7N1G9Wp4RIDR1RS0hqFyBfIw2lcuXzPQuVaoqFuLeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+95jHYF/G4leFfnnRWAcCO7JC89r+S0Sga7wH5CIzrwLEWb87i
	gjHx3m7jQSfZalgVnXoQt5ZvHsXAi4vx/DbsJBy4w0GN53AlgM1Am3cSj6wQbpm+CQ==
X-Gm-Gg: AZFdTZcwksuz8Bsli0RddMWmLuE/8cknCLeXXF0PduEqM6CifkwoAQPs8uM4G59W8Se
	hF4pvfb1TXUo8r7blF2voZMlvxiCZlt5krC27Fhe1Zd1TvHtVknGeHIDopmU5jWi6WCbLf2FB/d
	kOiWx2LWROw3wQNyVnN+CuQLDqaj71bcGWVzk9eikb4yLfdbShvK1dLge+WXLXc/nDAH1mkdoNI
	elsPEaOuguTG1qFWWQ/kDbwURgppx9kgQk2tgH7OPMazB1YlUDBZKyMJImX8goVM6siI85fENLj
	SOiQa2WyIupagpIVEajWeurV8tNPW5Z510jz2IK/UF3bAISTQg4mXaZsEz2O7P1+6LUkUhoUK9I
	RJaxZ8l0xlrh5fWrJoRMtJqs/3t/fMfv4ca4wVuueEMbwRbnA3yf5H9XaSsRIW/ob9FzaHDpbKP
	BSgB+in4vZ8PIAmUJexwaE3PI/MuWxLtGa6PzbVDRxHhV6kYeh/VZboLw+qEkgxBpwiJH4Ejbc6
	0smXBCejWM3zGm3yoD0bVNRN0rVHfUh4Y3FggZD5ZoZmkenhdnsq6kJ7xTCK8xqJw2aGswbogdw
	db8Q1Fhrg/QiQUXwcbKxTWsFch3k7ySFsuMtPeTn6LTbACiumLRvT/2lb+o1dj6LVMbtBQ0V2sY
	H+dC6B1E37zaYPDH9zcEd/SRGYHicPQUZoq+iW4Hb19BpEeN0fmSM/J3cWdb7F64F+hW0PO8S56
	vthxQTO5BHOueWLDTfALZymd7fauakBMtcUr9zPR3sAl+QJY23lFj/D8JaAb30bmfDpTL43TGM1
	KSFvt5LUAXxKUQYuhSgyVVD0KnSmO4wu0CzFTThnA2SnMxzB/Imb2xieLMVYJLE/NNLsZHqHcJ9
	PIod1Jl3OHrXzwp458lrBHLFhZoABqqbUH4TLa7+6H2qgspwEVZkGR5v4qF4fUes3cf+2fSFju+
	o
X-Received: by 2002:a05:6402:360a:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6ba37ea37c3mr6312108a12.34.1795368826644;
        Sun, 22 Nov 2026 09:33:46 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2471361000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4713:6100::a27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8adbsm4233364a12.17.2026.11.22.09.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:33:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net] net: dsa: hold the device a queued FDB event is reported to
Date: Sun, 22 Nov 2026 18:33:47 +0100
Message-ID: <20261122173347.791590-1-julius@bairaktaris.de>
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

dsa_user_fdb_event() queues an FDB event on the DSA workqueue together
with the device the event was emitted for (orig_dev), and
dsa_user_switchdev_event_work() reports an added entry to that device
with SWITCHDEV_FDB_OFFLOADED once the switch is programmed. No
reference is held on orig_dev. It is a DSA user port only when the
entry is on one: for an entry on another port of the bridge, which DSA
installs as a host address, it is that port. DSA flushes its workqueue
before one of its own ports leaves the bridge, but nothing waits for
the queue when a foreign bridge port is unregistered, and a work that
runs after the device was freed reads it in br_switchdev_event():

  BUG: KASAN: slab-use-after-free in br_switchdev_event+0x41b/0x550
  Read of size 8 at addr ffff888004d00000 by task kworker/u16:0/13
  Workqueue: dsa_ordered dsa_user_switchdev_event_work
  Call Trace:
   br_switchdev_event+0x41b/0x550
   notifier_call_chain+0x9a/0x2a0
   atomic_notifier_call_chain+0x5a/0x110
   dsa_user_switchdev_event_work+0x32c/0x4c0
   process_one_work+0x8e1/0x1640
  Freed by task 139:
   kfree+0x1b7/0x550
   device_release+0xca/0x250

Hold a reference on orig_dev while the event is queued, as mlxsw,
prestera, sparx5 and cpsw do for the device of their deferred FDB
events. Unregistering the device then waits for the work, which does
not take RTNL.

DSA held the device until commit 425d19cedef8 ("net: dsa: stop calling
dev_hold in dsa_slave_fdb_event"), when the report still went to the
DSA user port.

In QEMU with KASAN, with dsa_loop given FDB operations, assisted
learning on the CPU port and a 500 ms delay in its FDB add (test-only
changes), deleting a veth bridge port right after an address was
learned on it gives the report above in 3 of 3 boots, and nothing with
this change in 3 of 3 boots.

Fixes: 93c798230af5 ("net: dsa: call SWITCHDEV_FDB_OFFLOADED for the orig_dev")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
This and "[PATCH net] net: dsa: do not run queued FDB events after the
port left the bridge" <20261121185821.1471559-1-julius@bairaktaris.de>
both change the end of dsa_user_switchdev_event_work(). Applied
together, that patch's out: label goes above the netdev_put() added
here, so that an event it drops still releases the device.

I used Claude (Anthropic) to help write these patches.

 net/dsa/user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..5e72fb34e308 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -35,6 +35,7 @@
 struct dsa_switchdev_event_work {
 	struct net_device *dev;
 	struct net_device *orig_dev;
+	netdevice_tracker orig_dev_tracker;
 	struct work_struct work;
 	unsigned long event;
 	/* Specific for SWITCHDEV_FDB_ADD_TO_DEVICE and
@@ -3686,6 +3687,7 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 		break;
 	}
 
+	netdev_put(switchdev_work->orig_dev, &switchdev_work->orig_dev_tracker);
 	kfree(switchdev_work);
 }
 
@@ -3764,6 +3766,10 @@ static int dsa_user_fdb_event(struct net_device *dev,
 	switchdev_work->event = event;
 	switchdev_work->dev = dev;
 	switchdev_work->orig_dev = orig_dev;
+	/* The work reports to orig_dev, which can be a foreign bridge port
+	 * that is unregistered before the work runs
+	 */
+	netdev_hold(orig_dev, &switchdev_work->orig_dev_tracker, GFP_ATOMIC);
 
 	ether_addr_copy(switchdev_work->addr, fdb_info->addr);
 	switchdev_work->vid = fdb_info->vid;

base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.53.0

