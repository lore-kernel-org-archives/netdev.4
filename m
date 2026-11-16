Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819605;
	b=5nqRy7yf2LrZ3aCHtSXLhoaf4JxO6biz/767eclW/3hpQw85wsfgWCiqVqWBNEr28s+k
	 D81FqAVfKGtLU5p4PpMNpz8r/FRiKG7LJM1I6AalEXtVFNfOKJfX5nz7MXEJCC9RqTOoo
	 mUBCKHQCjEYQb5TdlTpfZ/JtXRRrj+zlBWh+2ro4kA6KlElvaWUpmmjZ939FKTJQAmQvN
	 CAMkKU/3qIYuzv1UPM92xbNJlLzDMmt+6Mc3s6V9Wznb4xliDN1vKNKaj51N/iyIjDzMd
	 WW89+8R0YlDXyOQivS9nZNhoswPgZzHOh3G7XbpiukJewxtoznwVLKaIStU1h8+8VUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
	b=cVZKph+YyHL8rQKv40g6qUqcX5gE4EodHcbCAI8vf1g0kCn95EzJPP5tsYdfD4R3cR4Z
	 oBWlGtumg6Xtxxgu42ZT2Qh6NdQXaDn0IExH+HhzMQixMzpVBybupN9jUcHNuyRpURRwC
	 +qRmiJdLpIXIGi/5N0HezMhrvrujjCMXWFCcj78ikRimjMmGS/zxJADMA4tOvvYzxXbkx
	 VgUOsT9LdeeOp7rriccuH20z6BX92DGrpVBGpjNjJ8a+886NMGx8TzLns4AW/TDKahZHV
	 3hQg7cajW4YT81euLbNz7YmGfO6h63qCMJmmGSl2yc2jAtz49dZMUwJ3LzJ1de5ic6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A43606A33E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A43606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a76f63b243so3789737fac.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819604; x=1795424404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=o+4V74VYHHGEwhhJlNUfTApJrT15j5GcawAo+tYJ5Cwh4eCSxw2DFkjvh3s1Rpjaqc
         CYutTqg5MNgSF+d/0tsK4el7Oyq/M+4zKiyqTREVC8wa6sd2i+t00qsqz96u2a7Do/T0
         S61bloURCFvfTqbXq0Ivde3n8DJRjFyxYeWwkz66nnloFZwncVFMCBsyiBbwObOuJkz5
         IskLk/0fnKHf8yEKHIselPnjHkt7keVKHGti9IJMT8vSs/NaEStLdb6Peu9/noldepLy
         UEO2OvL264NrgOsxdAkcu/rXYYC9kHJI2VxxE/B0xq3H4jvCfG5U2eQZmRLR3I14tg3/
         agVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819604; x=1795424404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=JOeky7Q8PySqbJ9pW1RZh+NMwiTVrG0+byIwG8bRHr8Aw1aB29cIsmo450/+YxGQDC
         kPndPBfmf/V1KiRCYEgrfEuaVWZmFgWctwvcmTexHJVnzu7BBaUkPm03bycSoxyECleW
         NeQSGGO+dwnEp8Ab5mG9At+t6bbnPioSFcMasJoZGBuqapuPh+Sj5xwKAf4+C4RYth3W
         NxJ99wRMhTesduMB+i5Dtr8iKAUN5vfvyuoEWcdY/qEc+XXCoBePM9PiT3F4KA20j0l/
         AwLINn2EIcf/jmnCyhguFZdo9vULMRnP9RNSW/GvZPEnrXiTca6cp1erAGv7xDkXYWO1
         hNXg==
X-Forwarded-Encrypted: i=1; AL+hErGuHBNwLsntz/6X0zEVoio/IYpDK5AVImN8XuakC0tnFDL8QDcelWIGRkyohAE/rnEKRBH3tGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K5LoRbTNaZIDI4rS1hAXbJxU/gq/L63oOcY1hQmUJPRKF8eB4
	CYaUkPpXY7oS2cMqtfdW7zCRpwzGVE4LJczK7xPaoJbeVoHBXrMw+roK
X-Gm-Gg: AYBFou214qf2u2gluHGGM7zC8bvpUqGpAo0zjdtOGs3lwcihQh6ZVQdeWAvVNlbQ1/3
	a7q4Ke7NgYMT6mA4xkP6zh8nx19qcuUx2x75PlEO0Kdj945BcL43EF+IFDH7+zDVFWjV8xWC37Q
	Zol8oOF1+uwQLL/gyOXM3EREVly/9pWuQTVyKuAIpoxzhtlPjtY6gGCj+vvWQEIoD61gxbiXhot
	VgzP6VSDBc7OSFsD3rWBi5xIxcW/sEKMn0YSHpEt0+yaMJK6dgcvfJ301fcjymK4mCXUq7Vbxyz
	kP6PYzAikrWQ2oxsXaNcuQJAUULEoatkGYM9KgzlgyZiaoVtkxEsyWz+U09fMvCnYBLSxp4S7S6
	R6ojOxQoEAecqbzPLETMI5+ODn2+pRg3s+g4wq6to+xolCVWw/FInNh7uCp5uYJnUGSz78bUVEW
	jaqKUnofiI5yZs5YLda/+PuGvCl2tCyNTwlPPAQxKCP9H2k577pqEDDvXeNSnhA9eKKRIVgcxXl
	KaD0UhYB+S9sFxN/LvwDr5nbq+hAsILlm52K0zatJMwVyl2ccIlVKWR58/EbdK0zAb9mM5wKTgc
	Y+y+6uwW89IUXv0QvkBKyFS2CSwTo4m4TrwqogLX37OvrDedNtaKoFuCKuNjibgXo3jXFKedM5Q
	hzB8XA4SxFMDqiAV08/iWFNvQJz1VOJDGqHBI8rDGr4kcGd1+apt/GwYYkPC5ra93v7ArebIxaj
	a1wRieQq+MDbiYsrl/FE0qFde/CJppf+SqbGz4cGWGX/n0xOF15w==
X-Received: by 2002:a05:6808:3383:b0:564:3e9e:b498 with SMTP id 5614622812f47-56e65624042mr5371665b6e.22.1794819603048;
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v6 0/3] net: phy: report ACx00 receive statistics
Date: Mon, 16 Nov 2026 01:59:56 -0700
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QzW7DIAwH8FepOI+NDwfoTnuPagcgTsO0kCrQK
 FWVdx/JNi3qpEhcjO2f/vKdJBwCJvJ6uJMBx5BCH0uhng7EtzaekYa61EQwoTgTQNPVdSFT6yf
 G6KW90ZRtTnTktDbSNFoDABpS9i8DNmFa7ROJmGnEKZP3705hPtDnhV5mnU1I3WCjb5ev3+mXz
 oa49NuQcj/c1pgjX8WfRNVOovJKLFmD4giqduztXMDPZ993a45R/EmF2pNEkaQ3VikApj1/lOR
 WOu5JkjLaOK+k0L5yCI8SbCQu9yQo0tEoZyxYbvS/TNVW2r1TVSSsDbe6qUBquZXmef4CKiQME
 SYCAAA=
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

AC200 and AC300 count bytes in received frames including those with CRC
errors. Define the existing PHY rx_bytes statistic to include bytes in
frames with errors and use it to report this hardware total. The hardware
does not separately count damaged-frame lengths, so a successful-byte
count cannot be derived.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v6:
- Define the existing rx_bytes field to include bytes in frames with
  errors, and use it instead of adding rx_bytes_total.
- Collect Andrew's Reviewed-by for the PHY group-name correction.
- Rebase onto current net-next.
- Link to v5: https://patch.msgid.link/20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com

Changes in v5:
- Split the existing PHY statistics group-name documentation correction
  into a separate patch, following Andrew's review.
- Narrow the generic statistics addition to the inclusive receive-byte
  counter.
- Derive successful packets from a coherent packet/CRC pair and report
  them through the existing rx_packets field.
- Keep collecting CRC errors and inclusive bytes when sustained errors
  prevent a coherent pair, with separate baselines and sampling times.
- Skip invalid or unstable byte samples without discarding usable frame
  samples, retaining the measured byte modulus and sampling-gap limit.
- Rebase onto current net-next.
- Link to v4: https://patch.msgid.link/20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com

Changes in v4:
- Invalidate the ACx00 baseline before accessing counters in soft_reset,
  since phylib may already have reset the hardware before the callback.
- Start a new collection interval on resume and after gaps of at least
  320 seconds, including system sleep, preserving collected totals without
  interpreting unobserved traffic modulo the hardware counter width.
- Clarify that the byte modulus and frame-byte boundaries were measured
  on both AC200 and AC300.
- Specify matching frame-byte boundaries for both PHY byte counters and
  explain that phydev corrects the documented name of the existing group.
- Mark the DP83TG720 conversion as unsuitable for automatic stable
  selection without the new receive-total API.
- Rebase onto current net-next.
- Link to v3: https://patch.msgid.link/20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com

Changes in v3:
- Add generic PHY receive-total packet and byte counters in a preparatory
  patch, retaining the existing successful-traffic counters and their IDs.
- Report ACx00 packet and byte totals through the new fields, leaving
  successful-only counters unset.
- Convert DP83TG720's inclusive RX packet count to the new total field.
- Bound coherent-counter sampling to three attempts and skip unstable
  snapshots without making phylib take the link down.
- Reject out-of-range byte samples before updating the hardware baseline
  or accumulated totals, retaining MDIO and page-restoration errors.
- Rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20261102-submit-acx00-phy-stats-v1-v2-1-3c8a664407c1@gmail.com

Changes in v2:
- Rebase onto current net-next and repost after the merge window.
- No functional changes.
- Link to v1: https://patch.msgid.link/20261025-submit-acx00-phy-stats-v1-v1-1-d3d461e46db0@gmail.com

To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
James Hilliard (3):
      docs: networking: correct the PHY statistics group name
      ethtool: include errored frames in PHY receive byte counts
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   2 +-
 3 files changed, 222 insertions(+), 5 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

