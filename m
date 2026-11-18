Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998028;
	b=iRhn4BURA0kJrtv2ETOOF64JbYE7Yt4SV6aqfbYGgxkrMltwPCPXPgxj7Wdn1CgYjEUj
	 NMwyKQVvU+ep6IS5mpiVmHxekIIomHhInYp1/SynpABA7JFsy1RIEJdLM2YZVz3wV5KsD
	 FgNNxrztWEF/UOIBpJgHpjQexppN4c+QlLLVE0cU8+Dw3OEyBVF09d18a+7McGGq9ln2u
	 n73jcY9aXGc16hRGsvVkRg3t9N/xXn5uxYixdpnHJN/sllqRxUZYV68i3/OXmS6nadNNP
	 Xr2RTG9k0gzkHjeD+aeInafNt0mfoCCSUmmkcrpy7Waz5jAQD8lJc6vYJUfhP6a15gA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
	b=KGP2NizCFTzzfqvSVPVv48rTQhX83HWEUH3jYSuRV3fPTJVfsMS9NRMMI4Ak3Hh3R4Bt
	 PNEcw0tbX6Teoxc4/S4B9W1GDS0rQU8uw5aPhPzKM5ZaLz70E3w5Wo0+Cz4F+zEkG2gpV
	 MXN6xgBreZIOJuGqZH5D96rW83gr4EuzjVbJh5R3wRpfd1rdpVlg0VXFKAZBax/m6Wzaq
	 JFDmlUUYGI3QbwbZ5copZc0Sf4XiCDMikWqpLYt2I2jt9VOUB9SyTuWXeg6IlL+BEyNON
	 bBJVWsCA0WWACrqnh8H9r5ALvUsLdHJq+ZDP6pFGmTXbIDshW74CNn+HIrmniyYXyjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1opnPCT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1C8606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1C8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1opnPCT
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-862aa241d77so278536a34.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998027; cv=none;
        d=google.com; s=arc-20260327;
        b=gyBELSJ4RI6g0ZWr5yCClhFx5VKzV+Q+gVUvRojPddeLUxG3IY9dbBgC0OIvuZ1a7c
         15t2QvpLesqhLGPCg5Und+3m3dT8/juIA7ivMgnfjHXKtMNz9YGBaHfWLHX687WbTFo2
         Ot536QmC5SnEik//qUqkQAQUC8ZuZwz+6q/xw7FBNzLFXOSrwCRq6iXCGaxMEBeOgP92
         OJKhydaCSxAZs9coxf4v6FIgtKNWAoRmimRWDeiFLEfa2Z9ZeF1ccYK2cPg8aCJgsuHo
         v/PlrHTK6S+7TWnlkIqN03UJVgyziUwWpvCv4PDYOEKpuDtMXsHPiHOd829jN4FyV97s
         kFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        fh=FhtaTyy8il9eSA8ePT6MPwqpCJIyFUGDN9A9+GXk/Os=;
        b=JTvgAQPO2Ej3IqXjJO8LHI3yAVGKXQA7bsedSlfw/SsGjA3K6t+q/xri0uw6p3vQef
         sky+7KspRxtVLjWLKVDyy6yP9loNTeerczLuwHiFMOmJVR12DuD7dY7oQokGCoVHA0Ln
         zXIlVi7c17AQfD8LPQWqR1A8J4WU2WibR1poCwRJzZ4bmyl++KjHiX1gsLWERZeMmDII
         XGiviyzP2/JczsVA1dlsf4qfp3EThnDCqERKg8UnAijNuGRFF5n9LQkKIUSkDIyl381u
         fRmxhT19KYu+k29crefq268yzWHaIWlslqh97MfH9tNqXaRHsFZhZyNrE9ojoXC6WDRx
         zJjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998027; x=1795602827; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        b=K1opnPCTe+6EenhPUqp2uPc4X1Et54jZcWV0TJxbKlCTOz8aM16/+ZLVcJXnC02J0G
         4AvpeL8VfJqh6abrfl6g9MQjL8y5qYe0gMgi1Rz6L2wErC69LdGajgvXljm9P8SVIbIb
         jWuuTUv3Lg3MagKSswUq7ZDHzNZC5mE8PxopfB7WmdeMkNFlQtZPB3eWf+ms6JcgrTwd
         yUPcIk6n5pwlX5+8odCWTnYh4XxMu5VT5YxpA8uMngtcQLi9m+9zxoavJyPlwX8LuWGG
         PQKXOdCQ5xQri4LwPcQvhUHN463PfN1FdLzK+uFHUxtu+HVL5sAGyGH0o74zWhVHnMUp
         pSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998027; x=1795602827;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eHftBICfL5lf7+1UD3fD4oeS4Rb6SDVondnJse/gAGE=;
        b=bb9O10tYo8rnqU8C5z8wjLUTWerWTnn658IrxiT0xfSaP+YdIi4TN2q0/0Aq8SjfbC
         tu7ahUMfj8fdmVdijilCbZjUjF+fCG+G83EZS2kNDbD7RM9JgKzwSdas21xi+EVEfteB
         +F6xPDXOHwjjiuHsET2xsmoAzirim0XYcYJDqBZ3HCxygLE0iZbPnzplBSCNbGYvhkfh
         rCcpGOmXds4apNk+a07KZqCn2IWsPREjVU1jFLojjwNHyfTOT0ay6faNY9xMcO0gYfbh
         +4dPTs3iEolv7ap9ndiAnL5w7GhZqQtJUZQMthXHHknHxYzssd3c/QkvlbACTSPly0j9
         yeNg==
X-Forwarded-Encrypted: i=1; AL+hErFHfnS1Il+VARoIrBofcfcYqrmkO+64g+3IxmzQKqmR22PlzHKwhVLKEvpg0guSEofuYF4WbVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Us+jh5QJMqp2pJEBXzfl1WggNbQhZriTau3FBCH6jUGbaStQR
	fytatV+XKH+hkNZvhXK9RH9317q3l0u77W8P2AtlBiwjj6V64TMeFXiRKXwHWjER/jrt50TCScX
	7JVX3rU5lhu4lyIcN5LDKYkbPevLSQ/c=
X-Gm-Gg: AYBFou2EMWWWBi3zx10tTgS5rW0AQsoxPOiVDDGvor/Yz+aomr92pDsAnsGmOyJpU7/
	P7jkcf5jXAeyiQfRCS3gwkn9ndK8bDcM8K5obPwziBA/doyGzFA+HVfMBornlqRMsj3w7SlrxoM
	ED5YuA8tvoEOsM3vkp6cqbPeXU+itdnhTIBjeAu7g8KU11RIhrUjqsvoZwOST4EnQxtw/IMU03l
	mQvAVU5meJJ04Y0BZ8IPYHi5hy1MrC7FZtsZbXDUe9J3DSckJ4swu8ynBD3JZcx/u2q6SMHJvd4
	Ck3UfC1zRked7yfXYJV7AhVF4kFky90DgNHkH+5cmgMt8gULUAVH7UeE7r6xnxsUVo+F+ruSKga
	EcoQ1JXk4F3YZXvsb+JQDjYO7mkmb1pGuIeW5HPmleZJth3GMtOreAjhOJJw=
X-Received: by 2002:a05:6808:518b:b0:55c:127b:b769 with SMTP id
 5614622812f47-5774182a61cmr2545994b6e.32.1794998026934; Wed, 18 Nov 2026
 02:33:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:33:45 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:33:21 -0500
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
Date: Wed, 18 Nov 2026 05:33:45 -0500
X-Gm-Features: AclHuK_AzINQnGjvOhKKc6IapMLdPZWmmHRI8UP9v6DIWKYZf5qhKJsW_DoCxYc
Message-ID: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
Subject: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe failure
To: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

Hello,

Following Greg's request for an applyable patch, this series addresses the
automatic PHY probe-failure lifetime path from the earlier report. It does
not rely on the root-only sysfs driver-unbind trigger.

A PHY driver can publish a devres-backed mii_timestamper before its probe
has completed. If a later probe step fails, driver-core cleanup frees the
owner while the phy_device can retain the published timestamping state. A
later generic-PHY fallback can then reach the freed object from
skb_defer_rx_timestamp(). Broadcom BCM54210E/BCM54213PE also leaves a
registered PHC backed by the same freed storage.

Patch 1 restores the timestamping state that existed before phy_probe().
Patch 2 adds the missing managed Broadcom PHC and timestamper cleanup.

I reproduced the first issue on an x86_64 KASAN kernel with a KUnit test
that registers a real mii_bus, phy_device and phy_driver, follows the real
failed-probe and devres cleanup paths, attaches the generic PHY driver, and
passes a non-PTP skb to skb_defer_rx_timestamp(). Before the fix KASAN
reported a slab use-after-free; after the fix the test passed without a
KASAN report.

Tested on:

  - upstream master 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
  - net/main 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5

The submitted series is generated against current upstream master
63fdb511c27afcebce797e3db580b3534ddfa639. I have not tested it on physical
BCM54213PE hardware, and I am not claiming an attacker-controlled probe
failure, privilege escalation, or code execution.

Please let me know if the rollback belongs in individual PHY drivers rather
than phylib core.

Thank you.

Kimberly Morris (2):
  net: phy: restore timestamping state on probe failure
  net: phy: broadcom: release PTP clock with PHY devres

 drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
 drivers/net/phy/phy_device.c  |  5 +++++
 2 files changed, 24 insertions(+)
