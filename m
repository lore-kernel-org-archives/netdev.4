Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114996;
	b=1UjvKHo8ZX+QzJioCUm9ZcdtkzL4xUZ76f3G8MaUS8JdC2PofkEJYcGzegc83Xm1A6/L
	 y1wElAcV35ZsWBWOMDXVIgvSK+dSkG0uvAt3WGycZCM6BaWRXzSMpfUdQvcMeormHNQAc
	 VOL6ot3Y6QiRp57zgJ5tJyowKr/oJjhGiWOxL6kFdSPH0HJTAQjnAzKeLkvVQkSa0uSBc
	 N4cWwUrXk2YDEZZyHQokgWQNJH/PNfH3kCbABc+TOlzmLO2nqNbSVOL0KwIxfuqnHxhjX
	 KSBZNDtRavC/+8iN3GO10tTu0MlJdzPhphUha7bkbRgpxDGXxBFATMqZcD87tmhUdmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yGFvb8N9U4YFec1+J2L9SxsAwyGtd5uIvbctO3Neuc8=;
	b=X/+X72OudiBwJ29E7Hy3Lbx2Av2Mxpyb+LMUPeahzc+ttevkPFuJdX5iX84Xu1IQ4NGt
	 VgiZ+9uITwzKs92me9PpslbJrx8mBEGTf+4MfhRrC/ud/6H5nBE+qhbLMmgfiHhd6UVSp
	 Xd07MucADSfn8EZomOiM3RtFOedd1SgCXGhzKLbi6jKm3S4lkzZ79Umal51ZCIMqy+qyD
	 IkL36W5qPyncTqRMAWFRNLmD83w9k7lhvAotI8HbHrjnDuaHA15yS8QyerMOmTTXXYFoC
	 xk/Q3ApohY2T08uOIbhIYbq/brJ88LESXSJhGQHUiEmYM6VTedROflLclx1qAsFOvKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ctt7UgI1;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D493606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D493606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ctt7UgI1
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0414c1062so389345ad.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795114995; x=1795719795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGFvb8N9U4YFec1+J2L9SxsAwyGtd5uIvbctO3Neuc8=;
        b=ctt7UgI1wyOAZoF+fViYViwHUigQAGcTyZ8P5Ur1pOr4da3HAqUbgfb5oaw8ckVOCp
         UiFNS4BXEHsbsXXi22pW+YpoziASppwu5ds+L7B08/JvjwHW+f6AVNXcfk8QX9FhuoZZ
         0idhE9/p8b+cn7sKVEgOji3gj7gj2AhO+KayaUr/zgVGJ7vAPCOSQ/x/7RpIYrBlVDR/
         TjmUVuieM0ukYMkmdaUf/2juImk0mtXm6Ju8DQbp9X86mIx+kU86YmJdJL9+YFj5Gh1m
         MbrBlzpgLXlQmiQKJZQTpCZevP2yGBpd8BMYzUGXZRB7ivw/JgoGCxOR8J1nFsF4l1dL
         56fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114995; x=1795719795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGFvb8N9U4YFec1+J2L9SxsAwyGtd5uIvbctO3Neuc8=;
        b=a62EJMKshdQTjJmHy8KTJtsMcp3ie93bXZiiigoawIBBTae7TjY32dL6WCpM4DCkJu
         kq3fzlGgybag36EuNkq9WLyiRpG5HetUB3jqFCgMCh1mi1Sd6TalacWTUaNZIe3BQGgo
         Y3UNsnZLiD2Y+gvM4KWwWaNMULGMk9TjpMj8Jr4zXlthQNuYYtYZLwPrRdmctDtpaTsj
         2yOn2zblqFk5GJZpGw2HkKQMdXF5Z7jT2aSYQVeZAIrCUHvofBMmSl2P+ccKLXCs/PhC
         eeV2gzSQ+SPFlKP5PAwb919hj/M3ooaUWG1mbwrNygcIuC741m9Wt61L1rOPCM/3n+I3
         hRDQ==
X-Gm-Message-State: APuU4Z+iqtwrFCEBYPS3mm7xORbrQxGbo20a+fKroRQlhttZXnlSQtQF
	C0RJg5tVmwH94goZ/aMtPNDvb624xbZ7VQ9xLixdfIgfNhOzqR6oz9wmmN9UtZsezJHvf/5DLWp
	+R51SN5Q=
X-Gm-Gg: AZFdTZcFiQpv7hQ/93o10AV9uRMWnFZxno3WzB+1RK9crH+s6Qyc0GIvsvMZ/BRgQNK
	jX78SFviAkC8CYER7RuGG2PmNOAolppMkKRQt0f6jRiydvZ9Oq2wvMiYPv00LHUY6FL6K0FWmRH
	3hoZ5a/Hjy1tmklCcr016cbMouLfKjMyMjPi/Js8qlbFO7UCABALjVSD8g7WWD14AfgDTGirCpM
	gRjpSVTFMgDREWSGWoOK3yOZuj2VNKPg/BmNOIc0QuaiwdN9hTZDUx0Sq3NWN3k7eo2TXpcUJEg
	lIR4CPIoApRYGzC5WAKlFLfc7FGJ9B0D0+Gd8nl5GUW/JUwwA5Yeg8hp/S8HQFw0kI3ALIKdAA0
	d13RfulqM/OmRXa7AIWFEgZyUMyfGG3MepOJhZBbvCgVyuo9R02Z6TxSd+NzeALn3WuhTzzmr6d
	aitlUrk54QLMzCVTw3d8hvhP9pk52uI9ruJ6WPnp8/h3870//VmL8rBCSY/doWStuV9lvJ4zVJC
	ost7rzpmdZB9Fuo6HbNzAHNtjmKlktB3x8mFKghVuGyqP2YuYr6Dda58fD4qRZpTE0Sle/EhsJf
	in289PvCdIC44Ogw9TyFpdv/VCDTnxVF/0PbtJeSkvubkO3MRJ1/Q/f01PkeJ9KBbFI0
X-Received: by 2002:a17:903:2442:b0:2f0:2aca:6795 with SMTP id d9443c01a7336-2f040ddd6eemr3760025ad.18.1795114994711;
        Thu, 19 Nov 2026 11:03:14 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:14 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 0/7] bpf: fix mount point parsing and drop the legacy loader
Date: Thu, 19 Nov 2026 11:02:35 -0800
Message-ID: <20261119190312.578885-1-stephen@networkplumber.org>
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

While looking at OSS Scanner reports noticed a pattern of issues
around the BPF loader. The first set related to parsing of
mount points with fscanf("%s").

The next part were issues from the legacy BPF loader which
is no longer needed. This series rips the band-aid off
and related parts no longer needed.

There were also some bugs in error handling found
while changing all this.

Note: lib/bpf_legacy.c becomes lib/bpf_util.c. "ar rcs" does not
drop members that are no longer built, so a stale bpf_legacy.o and
sha1.o stay in lib/libutil.a and are picked up by the link. The
build still succeeds, but run "make distclean" to be rid of them.

The libbpf build options are gone: libbpf is now always required,
and pkg-config is the only way it is found. Both --libbpf_force and
--libbpf_dir are now rejected rather than silently ignored.

The last patch adds a tc bpf test, there was none before. It caught
a regression in this series that the build did not: the tc/ pin
subdirectory quietly went missing.

Since v1: squashed the four libbpf configure patches into one,
dropped the bpf_pinning fallback fix since the loader removal
deletes that code anyway, moved the tc-bpf(8) update next to the
change it documents, and reworded the export removal after Jamal
pointed out that LIBBPF_FORCE=off builds did have a working
import/run. Dropped Toke's Reviewed-by from the mount point check:
it now also restores the pin subdirectory, so it is not the patch
he reviewed.

Stephen Hemminger (7):
  lib/bpf: parse /proc/mounts with getmntent and check fs magic
  lib/fs: parse /proc/mounts with getmntent and check fs magic
  tc: remove eBPF map export and exec bpf import
  man: tc-bpf: drop references to the removed eBPF agent
  lib/bpf: require libbpf 1.0 and remove legacy ELF loader
  lib/bpf: check for missing bpf fs mount point
  testsuite: add tc bpf test

 bash-completion/tc                   |   18 +-
 configure                            |  129 +-
 etc/iproute2/bpf_pinning             |    6 -
 examples/bpf/README                  |   18 +-
 examples/bpf/bpf_map_in_map.c        |    4 +-
 examples/bpf/bpf_shared.c            |   14 +-
 examples/bpf/legacy/bpf_cyclic.c     |   35 -
 examples/bpf/legacy/bpf_graft.c      |   66 -
 examples/bpf/legacy/bpf_map_in_map.c |   56 -
 examples/bpf/legacy/bpf_shared.c     |   53 -
 examples/bpf/legacy/bpf_tailcall.c   |  117 -
 include/bpf_api.h                    |    7 +-
 include/bpf_elf.h                    |   35 +-
 include/bpf_scm.h                    |   77 -
 include/bpf_util.h                   |   41 +-
 include/sha1.h                       |   18 -
 ip/iplink.c                          |    4 -
 lib/Makefile                         |   10 +-
 lib/bpf_glue.c                       |   15 +-
 lib/bpf_legacy.c                     | 3306 --------------------------
 lib/bpf_libbpf.c                     |  260 +-
 lib/bpf_util.c                       | 1105 +++++++++
 lib/fs.c                             |   33 +-
 lib/sha1.c                           |  108 -
 man/man8/ip-link.8.in                |    5 +-
 man/man8/tc-bpf.8                    |  173 +-
 misc/ss.c                            |  946 +++++---
 tc/e_bpf.c                           |  157 +-
 tc/f_bpf.c                           |   12 +-
 tc/m_bpf.c                           |   13 +-
 testsuite/tests/tc/bpf.t             |  153 ++
 31 files changed, 2095 insertions(+), 4899 deletions(-)
 delete mode 100644 etc/iproute2/bpf_pinning
 delete mode 100644 examples/bpf/legacy/bpf_cyclic.c
 delete mode 100644 examples/bpf/legacy/bpf_graft.c
 delete mode 100644 examples/bpf/legacy/bpf_map_in_map.c
 delete mode 100644 examples/bpf/legacy/bpf_shared.c
 delete mode 100644 examples/bpf/legacy/bpf_tailcall.c
 delete mode 100644 include/bpf_scm.h
 delete mode 100644 include/sha1.h
 delete mode 100644 lib/bpf_legacy.c
 create mode 100644 lib/bpf_util.c
 delete mode 100644 lib/sha1.c
 create mode 100755 testsuite/tests/tc/bpf.t

-- 
2.53.0

