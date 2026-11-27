Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786838;
	b=bQeTNlA5wJzkCdzRYEwdj6OEBCxTLLrDnShsE3U4o/4Llsk0c0jMT93Hvon3XE/aDmeU
	 RQ7ovDzffxHX/uh8qcRnl2ptVxc1Nvh2DWOv9Vo/Iy99mO+8VPlOh4BcL+5MVq/CnymNy
	 hifiijXvGDy5UrRhCmKFWgIReGsjZaAHj+jY19oILIjG0lipevJ1dU5wpGM75Gesmf/iy
	 EXaqZqz8zg2DPNQYS5V91cdjRSoKrTWoEe0tufCv3E9whJS/rJD4OR8/NDRsPwc2+M8mN
	 5TEkOUurBDOQQrcAoMWAOVDzD4Vg3t3MyedN5gEEteuq7rmhyUMS/xsIgoXpH533zXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
	b=O2OmloyvuaSSl0UeTDRJArTX615JE5Mp2YxQwoifWgQ2/WXYJcmqSb0G/ChQjCwRolu6
	 uZKT0mtcNA3zvF4GTrTT7WJbbTymatV0aAnYXHOIHfBud2O6oDJav18Wv+rnKBJ7ealus
	 yUcHoMTYxnwiHMNbIfTBpGsvKFzlgadACrCFSPVcgbnLEisBVUv+MokXkWvOXXqlB8zKM
	 d63GoJcgR6M5C8IiQdLz64sqeHZ+mxs71TkEc7tFzqSfyGpjvZwAPQTEBR//gtUPvJDka
	 GqVVvCUL7HzUnxuc75HUABOnJkztpSWg5hxr/YqBpK95nEcpeON+Rm99HT0eMqSRrMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUgt5qQG;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE86606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUgt5qQG
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3925140b3a.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786837; x=1796391637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
        b=mUgt5qQGm5AAB4TrA9kpm4OZFjMZlLV6nefj31RrX5jE0mItObR+shV4hfCDLk4mHo
         ptMNuwC9mYwlK6M4NzmIYYwdtaHhtG+gUN88K3N1rcJ622iTFxHRQZyKs/sit7mxlotI
         rJ1S/lT1gr4q9bzmcbQwW+yHA39taNmakDkMjVFYuDriJ3s2BvfTy14+xv08aI2C7ppZ
         pAV2Z5KWBQal8D5xH8VO1GHtDpPriZTfgmbAZ4YNqBONblPyL6iFxi4sLugLxvMt5c25
         O3GXwlggEJYYvcWrF4aUpCJoEdQ3jhctSiaIkb4K+s9W5d+Q/MNrKVHRyyh+08m7H8Bz
         WTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786837; x=1796391637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoVAookeqxpBctfLqaghk9pJLGpO39zMMXshAYvBqc0=;
        b=NnLUYD40b4W4KrX3cpJHFBu1FMiYIf0vXsexoHOJ2N3QjGP/SvJa31oPGVHf2kMFWO
         aXZTToAheDyEo1FFtnv7oijV6HSNKoNtsAdu7Tq1kZ1yeUgTBypFfEK/2bE2OpmyOxpy
         FO+NHYLCKa30fkG//oW2LHNvVE8BxyZKlR7ZYhQye1UmCcXdO6rp5cq5g9idmP0KxTqr
         jQF2KmoNBl19j1r4cCuSsdir2lcKE5K0A8PGjC0qr22WKBiTjikJmdV79ovwCon8Lf7z
         roB+CYqty1/gp1IM15BmWGhxTXyXgwJVqzvU9QyP4+gAFn/kni46+nMEY8+0EOiBCisJ
         TVfg==
X-Forwarded-Encrypted: i=1; AL+hErFL7dg39ONwVNtxnfcf0i3j7bRDHognj51tU0RhbgP/itSmPW0p8uDZtK0zt5lLTdu7/8UzFzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FNbIOIpI2SQQ0xMx74Y2zBxsEBSMsCXHysAAf1+5XGN/jjC+j
	B9UKhBXuQwyxBE8eStDYwsMGF7xpQge4IKq9DsVCgvFeonb+5+3NzUQhIXXNWa+4R+FX8K0J
X-Gm-Gg: AZFdTZcHHguTstNy96b0OG8gmNANl69O92Eed0JGdiGKyKzarjfDhu+IrTLB6uSovEh
	TQdXuh+6AvtbQZ7deSQRh3BjoizpETha1DTGPbd0dxn0Yuh8Z26Abb5c7p6A4TPApIEWXESqvcM
	yhcnMz651KSLat+UV0WAvDAhrRNB22KTBsef5zjdeK1EpoXXOuS1JChfp5LUdaZWVAEzVVsMoEj
	MEHDpCsWQfKHyFYfu/psivLKX28oEUAHJr87Nv9Vw1b+ZFbd1F08PN7lKZ3kgWzF9egUrCCNir/
	LiEM8TdQOg06PmToj6ky2UFecEYCdB49L4A6rDKutBPbpg7AkgZz3ScQdiELGR36tCMLo72t3yH
	IfKDG5sBkxZfV356C1kWkBsNWvdS+VqUQ5rRE0tggZcNe5ZH/5sZuK/bgZ5N8+/nY4zT4qFlygX
	yl8Pxz8SvlJHlV2Oly7LatxuUV4KiJB02KB0UcGfxo28HUrzWKRhg3iMKZBylqfodjmRgrCCt8F
	2khS0056dFkHOFVHdqobnE/4QNOMNYwHxfF3jBuFb1TJ4+gkRUp4xhnpdVmyQf36Y05kzOGheZ4
	0jVlinlfr+QMG+3kZiviSvqQ15kBlE+S+XUh4qHfoyuBcgCQ6LGjUzliqdKZp7Gc7WmRyAosA3c
	0fJTlaRll5cRUd3kvOXKYRV8c1cKQrqSbyFrf0YtbJARLs4/qqdGp+Kj5++gg1T+zlbYezHYgXo
	EWM7/wZJno4y0WlPo5H6T5FTaGVRpFH9eyyO3y7Tc=
X-Received: by 2002:a05:6a00:ab8b:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8c87b8da580mr22941464b3a.20.1795786837347;
        Fri, 27 Nov 2026 05:40:37 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:36 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 0/5] net/nfc: fix skb ownership, reassembly cleanup, and NCI status errors
Date: Fri, 27 Nov 2026 21:40:24 +0800
Message-ID: <20261127134029.1813-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi,

This v5 series addresses all four findings from the Sashiko AI review on
v4 and includes the discovery method requested by netdev-bot+sinfo:

Changes in v5:
- Split the former v4 Patch 1/2 into four single-purpose patches with
  accurate problem descriptions and complete Fixes: tags covering each
  affected driver/layer:
  - 1/5: Document the data_exchange_cb_t ownership contract and fix
    callback skb leaks across rawsock, LLCP, HCI/NCI-HCI, Microread,
    PN544, and ST21NFCA (explicitly covering ST21NFCA DEP success-path
    leaks on READER_F, r < 0, and unknown PFB types), synchronize
    HCI/NCI-HCI rx_hcp_frags with a local splice, and accurately
    describe the nci_nfcc_loopback_cb() NULL-dereference / !conn_info
    leak (noting the current mainline NCI_DATA_EXCHANGE gating nuance).
  - 2/5: Fix double-free of resp after queueing to dev->resp_q in PN533
    (both pn533_data_exchange_complete() and
    pn533_tm_get_data_complete()).
  - 3/5: Fix missing completion callbacks on terminal errors in Digital
    DEP (preventing hangs and socket refcount leaks).
  - 4/5: Drop stale ndev->rx_data_reassembly on NCI data-status errors,
    unconditionally on CORE_INTERFACE_ERROR_NTF (outside the
    NCI_DATA_EXCHANGE check, covering listen/target mode), on
    data-exchange timeouts, and in nci_close_device() after
    flush_workqueue(ndev->rx_wq) on both close paths (guarded by
    req_lock and !NCI_UP).
  - 5/5: Preserve signed errno codes in nci_add_rx_data_frag() (former
    v4 Patch 2/2).
- Document the discovery method in every commit message (static
  call-chain audit and code inspection, with QEMU KASAN+kmemleak
  reproduction for the NCI status truncation and rawsock leak).

Validation:
- All 5 patches apply cleanly on v7.4-rc5 (4dce97c6c265) and pass
  full-tree scripts/checkpatch.pl --strict (0 errors, 0 checks; the
  only 2 warnings in 1/5 are checkpatch codespell false positives on
  the verbatim upstream commit subject of Fixes: 97f18414af39).
- W=1 compilation of all 13 modified NFC object files (rawsock,
  llcp_core, digital_dep, hci/core, nci/{core,data,hci,ntf}, pn533,
  pn544, microread, st21nfca/{core,dep}) passed with 0 warnings and
  0 errors.
- Full x86_64 KASAN + kmemleak bzImage build and real QEMU TCG
  verification (32 NCI 1.0 MIFARE status-error 0x01 exchanges as
  euid 65534 over virtual_ncidev): all 32 iterations reported
  SO_ERROR_OBSERVED=16 (expected=16) with SELFTEST_STATUS=0, 0 KASAN
  reports, and 0 kmemleak unreferenced objects.
- Real PN533/PN544/Microread/ST21NFCA hardware was not exercised.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (5):
  net/nfc: fix skb ownership on data exchange errors
  nfc: pn533: clear resp after queueing to avoid double free
  nfc: digital: complete DEP data exchange on terminal errors
  nfc: nci: drop stale rx_data_reassembly on errors, timeout, and close
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  2 ++
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                | 25 +++++++++++++++++-------
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                | 25 ++++++++++++++++++++++--
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 | 23 +++++++++++++++++-----
 net/nfc/nci/ntf.c                 |  4 ++++
 net/nfc/rawsock.c                 |  5 ++++-
 14 files changed, 110 insertions(+), 58 deletions(-)

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.51.0.windows.1
