Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728758;
	b=Ksa+OqgnRLQgLvoYL///Gapxod8bTpiuAJgPY4DMAQuzpGQElGHCXnWsR08HWXdLjgmU
	 GUOmZQT/Xa4GRoT0Qq6eS3SCGILA3nmREc8ujrBbJngZ/MXTzylYFGPHh6PtGM+LvAbVN
	 1P68mcU/v3i21zVTVwCXI+VIXoe00wXG1bZRalqgiQ0ZaDxUA8/o0XGr+kVzxcFAUBxuu
	 Oo43sozfXir51ex3rLoh5AJ4VAqPFxs7Vn86yqogWqnfpLS8oIMehC9D+SlFcA9bpBA2y
	 L41wPxGoLP5Sk+L6+2dJl3V+ksAVtwEVSXQwDQ/323hIuXCW2n1tva1NGZCdFScvryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
	b=y3OcrwIYq/+q1xmKjOzSBIOa/S5XlTEK8knaGKAWx7DVMW8UWZg24mMy4tTEXupGLtIr
	 IyriELJPPVggTnJMU1mINXJhw3wDMQL4fiEj8b26HSvps9xRy51Y8TWjK8bP6HkXM5JHS
	 0ueSyg2i25hMdvdVVpnbYMe6IXbty4YlW+bvQHzkQ1VooeH8bDds3NkqSKewEAu82ME+i
	 jk/f4K8ZP1MelbL5V8I4bO3TOJSlmh7SD32Rr1L1dV+p4NOKcbpwjMWNN1S4ZyvYIzoaq
	 UqwHgAzPmpGDrI7rNSbrVmp0gLaoA4Z9qgmez3Js3nQpLENN1k6+RVM83XTSqHt99Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F6606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-833e671ee9fso3593258a34.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728757; x=1795333557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=xJk4uMWpCiZ6G2s7rWpiHLeggzGdvma3jmXAmPOpY2O78sYu1VUmxlkqnM2JokxPzy
         S1puLmfRw8juF9iirGOyPmagsn0Ot1kxHjMmyVV/tH28ykkb9PzkuWRTO7pjAiBxWEBR
         zTatD8bXeza51KycKCM5eHAqCkYEQLa/AeRrJa7DKDPVcTHmb2eYCPU3CZI7u3MGsuUU
         WypEQvRT2TE1CGq2Hu3/62nuRGc7uDrbJbn1jY3Q7dI9fKmsEpvYl47z+8oSHBuy+68z
         3RfIeWfI3khlCJYpdGDOu1pU850bTONLyfdE+qEw/lblH34Z0bgRSHAde5yCsSxnLy0t
         1QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728757; x=1795333557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=kMXW3a9Rk0fEc0lfYzYCYqZhAyr2Iji2zg9nj+hs2hjqIEPwPslidlJX6OJdWzGk7q
         MWMnm9c9itN5cZyk7ITEnKesbWc7aH+aCkHnULMwRSweQPriEdkLb1iBVX3IIly5H6nS
         AYUpc4cxbkkH3itlh9w8FU4TUhwYXiYuSNE4k68ge4EKnBPX4ROc115ataxRYIbtWdrm
         /HP1cQm57APFFOZApM2q3SOewUX5LJ+ssw2sd9Z+9Jk8tQ3u8dj7dDAd/FO7PHQSj5Av
         qRZLMx/Mg9wrh/ryXxvHT3GgTcg7KEeV2bUvZUXx6eLblmqjhPsDwwUgNiDkGYeWVPK/
         HOow==
X-Forwarded-Encrypted: i=1; AL+hErGzR5CWZ7gCPoLOeNjj5CpwOLn3T9GlxxgZHU6d37cY6hjetx9Asq+M+tPRAjo4966oLZHCcnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z83VRS6K4zHGRkl5u+g1AxLTkVr9nwnDq87bnYrYrY3HI9ChFKm
	sW0RW+0/HL5//14qIJmDmG96Epa7alccEN9hYVUu5Bwhn6T7UxCd9xc2
X-Gm-Gg: AYBFou3V+RJdimWgjtYXLuTic1iRPVdkdcLytX94cKYugmKmXMTHaMbMYHDBszULKTb
	bABYCCY5Vf9AOtcwiJtCAiH8AYRX03PJsW7eIn8zJb9iXjDJlY1X0MIR0rrEeCIJhv6ErpKMiXq
	MpobRGxyVb+I/vrEMnFZG5ucVHce13Kkx1bnzWR9gAjSiHuZEu+EQj5DnLFN7o7WyLjKrocP2VK
	QoeyMjoVDrb+M+Ar0h0BWWSsOVP/grT4Mxya+uXvrEE/ZgpYcukdDkDXD52D4RbKMwKCgURLuwy
	t2/1RAzTmGmPGtq1ElcusBIxTsf1447cXFlBQ6IpUB3dwLKpcPLyiD8+kcuVm3poqASAqpUHOc9
	Cr9rk2d5DmIz1VNTC+Sh693cUluvRO40fnJWIeJyHpoNbCAgXFEKoV6+vdllJvmt3a+pOzt0r1Y
	xSgqFjlgI3bVV3/CyGzd9TQYeR2wLp96Lsa0hcJ+s9EtqpxKlTksxEoZqfsdFYgy69bV0PD/7Cx
	IV6R3B32BdCLQAI5DFLQZeZMkLBEg7qV7/MAT48+gKoOq1Ag91/Br2D+nHSDbGkD5QypEpg+ghA
	Ha3nXc+287aE0JJZsM8d+JiV5JitCXEKjkN9PYZ1eBuMNIX+bOskzhWSAtVruaeebEN083vunwI
	3zQYEGhHHDtHaEBsolYd1MEHWzn6LlDeCwy00mirD5tYKCS9hPAsgFIFYkWS3uSzJ5abLWXlQVc
	u3tipVq7O9uGQCEzg1Db5ywNQkpyFjiwsMiQynpRLDBYxiuokwxmw=
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-56e63285bd9mr7499537b6e.21.1794728757024;
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v5 0/3] net: phy: report ACx00 receive statistics
Date: Sun, 15 Nov 2026 00:45:44 -0700
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OzU7EIBDA8VfZcHaUjyllPfkexgPQ6RZj6aZg0
 82m7y6tGtc9NOECM/zyv7JEY6DEng9XNtIUUhhiuVQPB+Y7G08EoSl3JrnUgkuE9On6kMH6mXM
 4dxdI2eYEk4DGKNPWNSKSYeX/eaQ2zJv9yiJliDRn9vY9Kcw7+bzS666zicCNNvpuffrdfupti
 Ou8CykP42XLnMQm/hRVO0XllCzVoBaEunH85VTAj0c/9FvHJP+kQu1JskjKG6s1Iq+9uJfUrXT
 ckxRwaJ3XSta+coT3Et5IQu1JWKSj0c5YtMLU/5qWZfkCG3yqydwBAAA=
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

AC200 and AC300 count bytes in received frames including those with CRC
errors. Expose that hardware total through a new optional PHY
rx_bytes_total statistic. The existing successful-byte counter cannot be
derived because the hardware does not separately count damaged-frame
lengths.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
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
      ethtool: add a PHY receive byte total
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |  15 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   8 +-
 include/uapi/linux/ethtool_netlink.h         |   1 +
 net/ethtool/stats.c                          |   5 +-
 5 files changed, 246 insertions(+), 6 deletions(-)
---
base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

