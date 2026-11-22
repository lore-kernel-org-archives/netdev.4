Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375280;
	b=BKOdRG9FPyaTwWKDbfK2oDLx9H3rswF7w5wee2wE9uxGPu/QjZy/rxaHuh3HCkBHG3ib
	 pnVFFwst1ZPfv/Fgv7ObArfTIUdTqFekWiaM7JWDwYUCISE0bNTdYqehx65K+RYNl/3B4
	 GS+nI7tmG/4TwD4qdoCeS+IUtJ2jbKsH9vpcrWvS/B6uDlgMydk5effXtWjXW+f4E92P7
	 qQAZyWVzJB6uXAJNaSpoGRU6RZdMX1GNxvX2Jp0Kjo1/aeqVgiC5GygScRIHCbJKfNUi9
	 sDfhJqCB9Xo265Kiqdi+edqG/DjNreG0VJFvx6wQlbhIidHZFLLsg1NiMlaS32V1tPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w10pGPahh84PPcSjgYpFSJZpEhTwZ5QElxtP1NCGCv4=;
	b=oeRYbkWlwdyQV4BXQi1GB8Rr9945FKVSrN7FJlNaCVpluGswFnWhrCNlWYZj7Na7Lc2U
	 JvyocSTQ6q3N20yi3IBRCJqMOp22fubfNuyuogLHQyYCEfBhewdCcFLFg/98n7sNHK7vp
	 jMX1YEj8mUTwTVojhEYvLWIzMS4oiHVgh8owdc+Cqvg4rRrOQLn4U9k6NuDicNmgMEWQ/
	 ue1aAXdOjAjXsYSJHDGTHFKh9jeEvdD1TyQC/dNCqy5OZaawa36VdLBiD3Bl7uYuM8vbj
	 Drms7jv6j0CruX14yzFu/mLQWYGdLDO3Pg+tYSH8VTBY+zGYHX5abVGCu5tOFpxXxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Qs9xdtvU;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800C606A684
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7800C606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Qs9xdtvU
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50933bdf4bso583321566b.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795375279; x=1795980079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w10pGPahh84PPcSjgYpFSJZpEhTwZ5QElxtP1NCGCv4=;
        b=Qs9xdtvUQnISFowqKKwZeha9PCCzzgDKLoxmusvvH8+ULOQFXTPzjNrboQHVnioyQ5
         y7XsT71OUytyvcpPQzIKWwIUVOApTyNJq1c3MnhrnwwRBch79AmyTTwZvbAB/K9lTVNG
         AiFb3I/MuS7HHigsmAbush5LGCARWLRrjuyDhNap2iP0lg+/x7IBL/TcpQuKSsb18o91
         2DCIJF/A4rFywquYQ+JYMvS1fABS/cSKm1lCw4x3RFTkEwa4Lrx6G23wcBgUsoD2OTrn
         DMBBG6Ek1/sMqgIyWRFMvYxOgIu43FCT9fT984l7DE6dSMyjCBRjbvcBsW2Dm1+tBEe6
         fnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375279; x=1795980079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w10pGPahh84PPcSjgYpFSJZpEhTwZ5QElxtP1NCGCv4=;
        b=JHg81akKk12sfIPWvq71Ch0qamldLw7/D8MecaRVy8GKtsmlYWo1NEapQfPD5kWqsd
         wLke5VeRaLHCBachuWDBexqm+PGKu6hzxp98Z4gmiNmjcgAlFGRSOCIk5AM9FH5A7+GR
         f2RvbDs1xl/U/YkmsBAlo4rFPKJXEDMDNnN7tQOzKHWc0LTabJpDvyXzpFY672u8x+7v
         lncQxFk+o0q5StnR/SxCRA00b8wmdKDdRSl0qUAaZsMQrnXdJk42zQXXTVj0QzwvkbEE
         lgxT+1n9Jz+jy2mzxiYcCnLXj8KtDwclo6E+2V5YKl8yX7hikGNtjpfQvjCCxYTwKwlE
         ky9w==
X-Gm-Message-State: APuU4Z9PFmAlTLiNFD+Iq0XJzLMOl+ZSWTFOIRZBWi01wXvhdLwfAEgu
	noM9Rtow927aAKmYn+s8chi8AWSdY6/tPK4XOHzVu6nSIbVVMww40Tgz3fpfoA8zwg==
X-Gm-Gg: AZFdTZelIZbDDvd17+iitJ5F2bf9bnwN84uFDMqasiJ1qMEX6rFxW6pZySrQzpXHI+n
	Ox4nkCgjTmC4+5sMJCPugBGhbGeaSVVLJxDzRkoEVOgtibsBJ6jTov1yMuJodrmYf8Ur+QgglIy
	CTcvs2dDxctL2HM/9g0QSSY0Ju/cgaswZAhbh9y2GpYSDqv4f7TJPDiWKilgLiElvvyW7/frDsS
	tezOmYds6BDL/6vcserJWA9cFwntOCL4njWbJMOJ7RCAGdcknuux25feaBL022lu/HMs323x/ev
	DAi+EKgxgLMrU1bG9tZfybSdpVqndiHtWIbzo3Rd5yW7yuQ4giE4jLdJ9LDzxfSZQYCakM5bXBR
	ZPq1uCNch1xlz33d2Q/205CmWss6JUreq4LI5X2533Un/Hja3UW3AyM3iVdoEoBpI0k2oXM5azJ
	CjyPTSzqxFsedbD/XAE/dbQeAEsfRPaiAAowAarj5ik7rNr37xxgCD42K2NeCcRYS49uBMnaQNg
	cf5ILRwymLnMbk9LAKE3ORS6CtIOgR2n48jsHW2lnKirdy9Q1np3jEMg85ooptISBwOTp6SSsdH
	O9vvpL8SBu6g0BJvv4/Bp7ns0Ri38Tg7gKsmfrslhFx2//mpuI/trmSX3k/UkL2+8xNRw6ijacm
	KRS6CAu8pcUAhfe09uai71YC36Iw7U2B43puebPMp5AAMiVRrbBEkE89+D97VMkjhS71qON8Fdw
	IzBjMMEiv3T29GYDrPuQFXiyF6A1kdCqZR0H/RljS+KlryU4oYRFbcy3jiM5yTG65I9EbJu5/12
	gDYI6jupQD9TX75UpmzoB5hWGk/HXiFVcMkYLWDoVD4yHVF8KerxLMkyCB+1ibEOI7RxaG1ABFs
	qF8kXvEUXX7TOJs7UKI7pd1+SJ/ZyiSyugUFakr0ee5mMoTw+NbUUjE=
X-Received: by 2002:a17:906:730a:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c51319443e5mr956292466b.23.1795375278882;
        Sun, 22 Nov 2026 11:21:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a7000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4713:a700::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm338808566b.75.2026.11.22.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:21:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>
Subject: [PATCH net-next v2 2/2] net: bridge: clear the offloaded flag of an fdb entry that roams
Date: Sun, 22 Nov 2026 20:21:18 +0100
Message-ID: <20261122192118.1204290-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122192118.1204290-1-julius@bairaktaris.de>
References: <20261122192118.1204290-1-julius@bairaktaris.de>
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

When __fdb_update() moves an entry to another port, it tells switchdev
to delete the entry from the old port and keeps BR_FDB_OFFLOADED. The
entry is then reported for the new port, where a learned entry is often
not offloaded: DSA does not install an address learned on one of its own
user ports, a port without switchdev has no driver, and drivers that
program only entries added by the user ignore it. Most drivers that
report the flag report only additions, so the entry is still shown as
offloaded, and matched as such by "bridge fdb flush ... offloaded",
while nothing holds it.

Clear the flag with the deletion, as fdb_add_entry() and the NTF_USE
branch of __fdb_update() do when they withdraw an entry that the bridge
keeps. The deletion that is reported still carries the old flag, and a
driver that offloads the entry on the new port reports it after the
clear, since the entry is only reported for that port at the end of
__fdb_update(). clear_bit() is atomic and no lock is taken. A roam that
races a driver reporting the address as learned on another port can
still leave the flag wrong, as the learning path does not order the two
against each other.

Found by an LLM review of __fdb_update() while patch 1 was
reworked after the review of its v1.

In QEMU with KASAN, with dsa_loop given FDB operations and assisted
learning on the CPU port, and a tc mirred redirect that delivers frames
to a dsa_loop user port (test-only setup), an address learned on a veth
port of the bridge is a host address on the CPU port and is offloaded.
When the address is then learned on the user port, DSA deletes it from
the CPU port and does not install it on the user port. Without this
change the entry is still shown as offloaded, in 3 of 3 boots; with it,
it is not, in 3 of 3 boots.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: new patch.

 net/bridge/br_fdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index 4af091c19244..8bb40645bd6b 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -1031,6 +1031,7 @@ static void __fdb_update(struct net_bridge *br,
 		      !test_bit(BR_FDB_STICKY, &fdb->flags)))) {
 		if (source != old_port) {
 			br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
+			clear_bit(BR_FDB_OFFLOADED, &fdb->flags);
 			br_fdb_dst_write(fdb, dst);
 			fdb_modified = true;
 			roamed = true;
-- 
2.53.0

