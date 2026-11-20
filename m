Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209696;
	b=nDNwctpgl9k9LF8W6dxY+Xl2jUUex3E5gyfjXCItAEVFDJdAP8aLTBP7nK1l1qRSY/7i
	 mghVg7JhWBcsL9YPosPs35kG3KDdjjtquwf7CVAwX6L19MR/fCo1Lg9ut5KSfQXsxFdvV
	 S+G5o8qhfpfKGLMUuJCgTeXHXIodxg9zS9wflLud3WhPtlTgIY2r4/lTIpFGOCuUXknqD
	 UTEhbwvp8SBmKcahnXpgm3SlCUURUJ9lL2vpluSAWpg8b2+dmUW5K4GSE1jOFeXE7MJeV
	 EmMJIPQ03dnhKYYy499k9GIUIdjbdmUzgGnXnS7pG3xKSOcwTNzzAIvrkkAYc5PcoGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=Z6KcH4QNiI5oiimWSn7UuI8Rz0qkozeNHC59li9cafo=;
	b=LcZ5FnloB8Ss1YpOqCV6dgZvOopibyxNFv9nv1vZvkvrjQIsGqu7GVVIOE9mtOXz7GWj
	 7OFX8oJlSIL0A8WMQyKTmcitqb0VxPTEQ6+8OLv+Rx072/41w6/ZxWf5MXZVYBOGsl4P/
	 pA8Wi8s6oBi8/4rcyi4YVNWZtZswbuIiWfqbOAP7YkK+XyW9kt0X+XDWXABVLFnHU60jN
	 X4+WrtgrG4pqljAbmr46sRM3KHcgUey9arrIM1CIFNq0S0pJiLQ341Wsguenln508yiqJ
	 HxoIdCOxYogLVEhDT3hsnceKMeTcQLtR8wCOixA9tuc21uQOLnkReFO6WtHqgDPBRYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sh+IrPbV;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08D606A682
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD08D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sh+IrPbV
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so3588685eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209692; x=1795814492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6KcH4QNiI5oiimWSn7UuI8Rz0qkozeNHC59li9cafo=;
        b=sh+IrPbV7KfI3CLUovQ9oueqClfJt9+cYj7XxIrO+6EFSyWVa2gpWJ7DY2Xe+jq3da
         y+jYE4Ivyb8JgG9Um3GdkIrMZ4D7Ej4Sv60pfzzPR7VRo8bvHFoQmi4J5yP1Oh4DDJIg
         ytAVj5T11Mxc65I4PpCMuvn5US2uKB9FOg2poUAhu5yTuksfLzcGBVjuwiijyUtYdq52
         l7qVKlnQHNwyZap5u4lvZL1ttKaSR0SdB8CqfMWdoR0S+kVfagfVdg+zChmplT66eu9+
         pUTFeo/eHOO6T+hJBB3/T3+Uf43Hik1zD5Q5So1wtMtZ9I0VAbUnmFyWiGbzIEva7k/G
         kpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209692; x=1795814492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6KcH4QNiI5oiimWSn7UuI8Rz0qkozeNHC59li9cafo=;
        b=2vRP371vWOOyF1DqAiJllSjrsAQo33I4sQyov+kzTVU/jAv6DZVGjtbFNHrXPkcGn6
         pOBFMlDljxQVfSooRSl4NsJfJnCwIoA317RGlDQeCG389H9jk+q4S/0BhHNphQLO/wnm
         yonVZfNKjRPAe38/VYBB8xKrx8QfdEcBNWO+sR+tzuKo+2b7RGBM+XEGSuMeG0Bb1+fu
         YLiDCsf3dDOLjhsqvINQxvpeXnN5n5iOhnbLQ02WexqbS8dxltg1rg5qI4TXbHIN0UQM
         zG7ruTejPBLhEJLAq3ZV3xfbSJD479IRkqXSteTcPIQtcOEbRnwvKN6Z/9z5Q3cZOi1v
         Duag==
X-Gm-Message-State: APuU4Z+l+dzb+ZWnEabp/bZrUCg27VOMIXdaAmeNasdC7MLWExERXWii
	+s8aVdbhHTRkPoYnZeQVp5dGJyP9qbJpJC8F8Hbukzs8FGxNB/CIWvaumMJamrEd
X-Gm-Gg: AZFdTZd/EZX2KrqFNYRa8cG/9bREiFVa5+ahm5XBQ/Nc6uUC8s5Q5pe/6Dw0WbH/eQY
	buHf4HtAEklSYxA5E99Mu85OStEM0UqUgT/DvmemSSLMNfamnIl4TR8CpivujcS6Rd+QB9fHjKz
	EyHWwkUzJthST80Do5xm3C2231t0JA5xzsmFl626cJmAQPEvRbR20aYpyGPIsnTy7YyfG6zB6U7
	CReNzVmgUPahAT56vlbWkTpJwP0Lfl7jlrNOv4aPeqN3RtI+0D80NK6LMZKfTD5EDuvaMDUGptc
	18E3WfoTSgxf9uoLNfBYQowDodxnFLMFx7SWqrwur/HIWKzCsjHWz47rkJOphwj0E3yeCXtkFo6
	4SLjMH1BamUr+FtDqTImoxdM6zPFjue70eXPr1mleGXP12lEp4OdRxwM9gz+wC37IFFXXI7iCRH
	Vw0n4Qa0RRdMoGC/M0Exsm6QrHYSo+yMbRPXCoa5G4qjYTuxD3KvzLAc+XRrMfCwrQbsxqit8yV
	YAhvST17pEol+4sep7yrCfF2lt8skzCJh9a0RoEz0vhIB4kvwg5NDfpG9Vud6q/tytO7BwSpInE
	Q8YpgBL6UcW/ey8NNfTcLypJR8babLI91RSw/BAOpeGIt+3CN6gOf3rKk3IfrVzab8q1N5Q4KG+
	Em6B90p8w7Ao2GN/wPjHXnpbxpftm
X-Received: by 2002:a05:7300:2290:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3856925c033mr4126155eec.0.1795209690840;
        Fri, 20 Nov 2026 13:21:30 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm8341403eec.20.2026.11.20.13.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:30 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v3 0/4] ptp: fix timestamp teardown and OCP DPLL routing
Date: Fri, 20 Nov 2026 13:21:27 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
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

This revision keeps timestamp shutdown in PTP core, after removal of the
user interfaces, instead of adding a driver-specific stopping flag.

Patch 1 changes ptp_disable_all_events() to disable all advertised EXTTS
channels, not just channels recorded in pin descriptors. ptp_ocp has six
channels and four SMA descriptors; assigning artificial pins would change
the existing interface and cannot represent all enabled channels at once.
The patch removes ptp_ocp's early disable loop and ensures that an empty
shared PPS map still causes hardware disable and IRQ draining. The latter
also covers overlapping sysfs and ioctl requests before unregister.

This follows Vadim's agreement to fix PTP core cleanup in the discussion
linked below. It does not add pins or change normal SMA routing. The
existing PPS/EXTTS shortcut remains while another subscription is active.
Patch 1 does not claim a formal Reviewed-by or Acked-by for the new code.

Patches 2-4 are unchanged in code and carry Vadim's Reviewed-by tags.

Validation:
- 100 source-derived ASan/UBSan removal/shared-PPS runs, including the
  empty-map race, six timestamp channels and IRQ-drain ordering.
- Seven deliberate regressions rejected by runtime assertions.
- Five KUnit cases pass using real PTP register/unregister in QEMU with
  KASAN, lockdep and DEBUG_ATOMIC_SLEEP. All five fail on the old core.
  The test callback models event state; no physical IRQ source is used.
- DPLL/SMA source-derived tests pass.
- Complete drivers/ptp/ subtree builds pass for x86-64 and i386 with
  allmodconfig and allyesconfig, W=1 and KCFLAGS=-Werror.

No physical card was removed or tested. Other PTP hardware drivers have
not received runtime coverage from these tests.

Changes from v2:
- Replace the timestamp stopping flag and spinlock solution with core
  channel cleanup after the user interfaces are drained.
- Remove the preliminary OCP disable loop and drain an empty PPS map.
- Preserve the three review tags and keep the other code fixes unchanged.
- Refresh on current net; the PTP sources are unchanged by the rebase.
- The v2 80-column warning is gone with the removed spinlock code.
  Keep the replacement shared-PPS comment within 80 columns as well.

v2: https://lore.kernel.org/r/20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com
Cleanup discussion: https://lore.kernel.org/r/75abd6c6-f0ee-4665-9451-05e0e1a7a3d7@linux.dev

This series replaces the earlier common fixes, rather than stacking on
them. The CI pending tree net-next-2026-11-20--00-00 still contains v1's
mutex implementation and the three routing fixes. That explains v2's
pending-tree apply conflict; those four old patches must be replaced.

The original common-driver issues were reported by the netdev Sashiko AI
review. Codex revised patch 1, its tests and the explanatory text from the
request to test Vadim's approach and preserve shared PPS behavior. The
unchanged patches retain their original provenance statements.

Ahmad Byagowi (4):
  ptp: disable all timestamp channels after removing the user interfaces
  ptp: ocp: use hardware selectors in DPLL frequency operations
  ptp: ocp: report disabled SMA inputs consistently over DPLL
  ptp: ocp: correct the DCF output frequency

 drivers/ptp/ptp_chardev.c |  8 +++-----
 drivers/ptp/ptp_ocp.c     | 25 ++++++++-----------------
 2 files changed, 11 insertions(+), 22 deletions(-)


base-commit: d7f2d9b6c7d0ff0af7d19d889810d35dfe07da90
