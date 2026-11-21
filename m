Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252371;
	b=3D99uNIoIzyILnmgmBg4HYqaoB1cZbMB9Xm8m9ofG7OdjNEUqkphCIYPvSRQtpVPZLII
	 RNg/OVGc3YOstZnDBKyJAcszQNcckYan598MMdarJZzNIV6Ta5xHKU3UzUKxGM8tUgsc9
	 nVFqUyxrlDdVoZouqhNDNCSHrgh7jFlp7d/Dov1BaulVBjceAZ53bfbXoe6GO/bkXPnjm
	 u45pW90EY0wRrWedGNS/safT75tZox/V6r8qfcglJ6nYWmyZQ1Q0VVBwkFvyV0uodW3ci
	 vme7kxtR+aTTDLAdXWT+fnthOGNUtjCFuI7VF51Cx14943biK85QWWnJepJT6VFtSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vZBM5U+o5g5qr2VkJs5pxg0CB5Zub+BqFihXChYM5mQ=;
	b=CIZdDDC/1V2pr4WjpCPfF+wbIOdEQ0yJ3WgrvmFi8A5k526Lm+PrrxJ8eb+fOnxpvPLZ
	 ACvsookoBasbW3Ah9YLfPzE3L+EHf74vetq/uYvBkQFIu9fR/5sY9vcHKOmTzYJSqVv8b
	 nHrEWfDRzc9v6IfHEwPlqzJdHlUixVADSXzjckPpSEgs6RjJnDa4jnRl7B7snIwU3QX64
	 VfxEqk44pPMzwJqePB5xzNGJvfHWpucK33nHlLBGd5mSwJ4qEEfmh6P7i5wRPQqDG7hxZ
	 9KqQLqXSMm9ERraf+fawSB1mL2IATrQNhFOeyXi1nG0sIwxFykETC8wSgh7rJNcVGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EthhrU4q;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C82606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C82606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EthhrU4q
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so291837166b.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795252369; x=1795857169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZBM5U+o5g5qr2VkJs5pxg0CB5Zub+BqFihXChYM5mQ=;
        b=EthhrU4qZ5Aj8vFEJgZX3lbR4b8JbN7g4n4kGMPi4/QLADYqeR9t+7DvcVuoXr246g
         6gROY8Tw5HF6N/CKEH9ZbsrytOq3GVCJpA1ylMI/eqCkGq5lY6WhXFdHGKbsJ5VKA+oA
         79oWgzPtr7e6bb9gRsAqeeaoRQjkWkJ1uMraz1H9us7REcRorqAa3vq2FkcSym+i9Wko
         JQzvPYHoF67W27CT43aRekz3pXzomLoO95ki32G+S6QfNmcnCX5gfllhAHIK7t66ReJJ
         FVvP5BtAC7I5fcVlywWvtmEoj0ULm9XTWKbZT08bkltVdYv/DEuCoVv9vtwdqdTqhEzv
         o2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252369; x=1795857169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZBM5U+o5g5qr2VkJs5pxg0CB5Zub+BqFihXChYM5mQ=;
        b=eoVogiwkyzJnt5EZgcsomjjaPCNQne8rdUWqYXlpyUMmPEQ7pqcWYAKGGnuFcGa5xD
         dQqskadV7MXKdPlmPYM7G7yppcwyhO3a2JnFilB6aHvpxOcNkkkzhfBuQ9x6IoGoHHmB
         6JaBuTplyxa1yVTN5NLq5zf51sR1AsN77zqE4US11gCML5K5pZ0LP9halqkUVJLni8V6
         isLOX6WOisJp9TB8aZDQnar+Yg+9qIW1Xnu2b17JlCfXPMTmeHKCoUP/K0OJHPsoXU4e
         sqvJXrxjfLSIf1Ojibon7qAcrteMRlPbpXOWivG0k1jbX307iRnyeI9eoFbN6744IY7t
         7ywA==
X-Gm-Message-State: APuU4Z+v+XUJENjkTyfbEoL6a0NG1ucbrdtjDOUoxLbvKzUK0P5DHnLq
	/VzJyz3LxygZzUzOhTV0PITiQvBXJ8SfZlmZapb0fEwF8e6McwLoSeor
X-Gm-Gg: AZFdTZd5TDXXG5KgnG7Lj9tLxwBYqk9+VCzQLnisV0+n/pKwPAgXLa2sMuhadtUGCIi
	CSOquNEhwz9/g0l8yd6sJuJZNiTmzm6lM5e7ALVpZVlTy6DvdH6NUFuyTdUEr7/9is+gB0/0fx9
	07uPoeEqyImOplC12NcRfo2rrUXp5Yd2B5OcOigboBLpCIJkMhzqXixBh0gvKGtOP46EZL+2TB9
	CBfH3badDoiN9fWNSUy6UYNl0BwtlQgRqkLE9jNlZyR+YNT7IxHgkQjIS30LLovYUrRy9ZFORDm
	VhUrSZbi7khRHPYn/W/PW/0AMNPR+1RriW6OjStnpkEXVA50kHNDSAXQomQsr7LcLHElUEfAvq+
	A212nALjiTcvZfsViLko55VLSscErbBZuCzP9AR4quwUuV/Bn+2gGHKI0DggCffkcD9KgCfbKhj
	sOJhOBLuV1RXkxA+xR8kcJTyPq5B3TqGonxQSkpY/Wm3le94EKYDdyCER8D0QNKsVunh9p/b9F/
	ZHFqYFXbRMGWHnO55h2/lnjMdyWGhJ7gvjptJBM1rEdFOwKJsp3c55+XYHFgYyQVuGGF0E/Wa1h
	WJJ8IcSqfNuRnwbhgpLARYLDl7ux1OxaNWjaaZL3bKGerIylv00cIPAijvKpnmXPfoFoxp7paZ2
	DNqdpGdwOpB4xUfN46/fIRnfPp5/33bzMFFk/lhEMG8vIXwnF2fxO
X-Received: by 2002:a17:906:e081:b0:c41:1750:59a2 with SMTP id a640c23a62f3a-c513a5ea748mr428883566b.12.1795252369184;
        Sat, 21 Nov 2026 01:12:49 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm178197666b.19.2026.11.21.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:12:48 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kabel@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next v4 0/2] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T
Date: Sat, 21 Nov 2026 10:12:33 +0100
Message-ID: <20261121091235.1447291-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Some "OEM SFP-10G-T" copper modules have no RollBall I2C-to-MDIO
bridge, but the SFP-10G-T quirk forces RollBall on all of them. The PHY
probe then retries for over nine minutes under rtnl_lock before the
module links up without a PHY. This series skips the PHY probe for the
bridge-less revisions A and B, and leaves other revisions, which do
have a bridge, unchanged.

Patch 1 moves sfp_strlen() so the fixup can use it, with no functional
change. Patch 2 adds the fixup.

This does not re-introduce the generic RollBall bridge probe reverted
in commit b521003c27eb ("Revert "net: phy: sfp: probe for RollBall
I2C-to-MDIO bridge in mdio-i2c""): the probe path, its timeouts and the
MDIO bus creation for genuine RollBall modules are untouched. Further
bridge-less revisions of this part number may exist; they can be added
once their lack of a bridge is confirmed on hardware.

This series is based on net-next. Patch 2 has a trivial context conflict
in the quirk table with the pending "net: sfp: add ODI quirk and sort
SFP quirk entries" series [1]; I can rebase whichever lands second.

[1] https://lore.kernel.org/netdev/20261118162323.436219-1-github@bumblecito.com/

Changes in v4:
- Use dev_dbg() instead of dev_info() in the fixup, quirks do not print
  anything (Andrew Lunn).
- Collect Reviewed-by on patch 1.

Changes in v3:
- Target net-next and drop the Fixes: tag: rev A never worked without
  the stall, so this is not a regression (Andrew Lunn).
- Split the sfp_strlen() move into its own patch (Andrew Lunn).

Changes in v2:
- Match the vendor revision with sfp_strlen(), so NUL-padded revisions
  are accepted like the rest of the quirk matching.
- Spell out in the commit message how the rev B module reaches this
  quirk entry (its part number depends on the peer speed).

v3: https://lore.kernel.org/netdev/20261120063756.3677554-1-pawlik.dan@gmail.com/
v2: https://lore.kernel.org/netdev/20261118221450.1764790-1-pawlik.dan@gmail.com/
v1: https://lore.kernel.org/netdev/20261116093605.294365-1-pawlik.dan@gmail.com/

Daniel Pawlik (2):
  net: sfp: move sfp_strlen() above the quirk fixups
  net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and
    B

 drivers/net/phy/sfp.c | 54 +++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.56.1

