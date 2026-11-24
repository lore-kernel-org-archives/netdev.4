Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480537;
	b=nCoOCcxZaaKCphUkS3LxNB5rMPF0NlZNiXLb5AkU9oNK/MsNeLvenlmsY+1KE69G2ilF
	 gLKMCAxtaQbsfaxLnr42rOyigtBPp5gYlMio/tyokr2OPX4caJCyP/CYKXn8nZJoe1h68
	 i+f7Lc2EOTt6El/1X6wrrpdwggk46acFHEVDrZc5K6PubNQGq5S2KVyCS/Vq1e8jkIaZP
	 TWztrENI30NeZDqLp71IU6cI7Gv6shNZsDH/W7eLdwuTAEMvQevHzAydPQOjxSXnZKNal
	 0WFTVH2fESV0274wyAimqvOlETBIpI6TW1VrXN6nN8SU8RC75K8SkdqduW4M3miK1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
	b=GlSX51Nu2n4WmKRfqjmm68cLXuA/eFcV7U1Svs0KD2L/RmCZY/707gk1Nw754e7byGyH
	 hijyXAC4GscETnm3G4IuD49p1DJwmnkWtCjlVXZ479VHPY020+2WEtmKXlUJ0W932w/qY
	 bMEk9jlbmB8NyXen1zEAHdArnWGCRsZuvloQMEYaBm7CTSuEFODWvBA8scWG1DqSsk0jM
	 aIYgGghQzUD8C4mxMsmFCarjMLAfyqO1aoGXYETW63lSZj+2yWQGCd0+kV6/mI1DxMMYU
	 O+qRGr4DxiLG1ZK9tG1tx+XFUqe+PlbtTB06r01Cy0lduaFQL8zN59cieNKbYfxoLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="UGko/FDR";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C9606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=UGko/FDR
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb628232d2so2134510a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480534; x=1796085334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
        b=UGko/FDR5eWbbxq49NN6iIodshLicoRmWofIzKSkGsqd4SC8p5OBvI5rCFYcCHPy5x
         oD0EbNVJX5V6UZL4JO4uzefVG3aIg8cx60MU8f90uINstbdfaQ5UVb4duw1CUtrP5EE0
         hd7FuIhiJuVxeB/vg5kf2jHER29IIaVYcppuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480534; x=1796085334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54AZ6SKS/WGadGSayVpKrc9b+qBd+x9Tajkrt4xNULY=;
        b=WV5DDQbFPS+61E3YtNu+A2j2Q33G59dCBwbfwoSyTW1DFBUwYSAC8I8spBgVGPRIA9
         pZUitgxS706Fa69BGzezn6Le2LBolayYGjwbwQiJ+UBoSe4QWYfwcXSluYkom0M3rBjd
         nOMkfMxFY7M6dA7yxxo9cqrRE4nyrQboCsZAFq2mFH6OoiKk5tdKiYRMxu3DNrpPKkD0
         GzjrkA9kcdsoxaQr2wH/BmU1bwzf4ZTlLKrTvpJ/DmDkCgVNPNd0LAfNwZNw02ZseGAm
         LnQiLv4Eqztjny3hVThoPTZzHfGznsl59neAaTSrJ29CGeh1NTXk+fCPUUjY+ROeEnyU
         ZQTg==
X-Gm-Message-State: APuU4Z+S4wW1AJF2EGUxI5i1ZChnKv3xGgDSkI1txG0uDkpV5Af0/rkV
	5PoWX/+mVwNBSVvalV7DesdY12SLZJwmLZpwy3vd4wQe2JTwQ6pq2gNG9fioNxXZMVQ=
X-Gm-Gg: AZFdTZfcGVI2SwKMHCIDo5BjjWlGxpZouAzj1D/zSaEnpEtJpzTJBERPgctKGT7By3O
	ZbMCS2BQuZPihGCrxk6iCMRK4uE0zWZFVC/qz/5Q1siROEDUI71Nm+4oShbuUJJBDTpIScxiTvZ
	Lx4TtR+bFiSSe/yy/w7/z1oajiRtr0+Wb+CdKxUsgrXh8us0aPoQQ+6H2Lg4VmpleNSdK58txcM
	ezjJKR4KN7EIWIrECi2L2CG/RMFCfwMc7F3YOin6fci3O3C0+wypIhSkCuUp+RvhSJj3V2Pjn1/
	ip8E4o/QBYMV2tofbI9QsI5sxFurhgjHa6HmwpTXgNpwX2XfahWFIjcGoOJVmoNA3VGSrkbqcD7
	9jisT+zLWT32mxXoFHE0Tdh4XNqSrsa8Zap8rQoS9ZHfq/DFYSM5IFlChrxFz6FguMUKuNuHdIT
	irN7eJTNuLFHf2wHc0U45Dhj0HbsEar/qc71leqL8QPnOQzbfMmKlRub4WD525aHlSEpVkuWUeb
	24Xnzrp0vSHhhwB5OJVEXoEcfHmmxxBJVKY8QdTdJg8pZ2Yb3rbgXppCRoNKriGjQkWIDat+vtS
	oBv9Kdvy7hQPeZ4ndgAsxZSfPCNdsIEr29zPaWm0ahN3lTVpn+0daORoeUY8wl/HoYeCrd4aNGs
	wOAfCIDh1WfWAbf+2cTAs0xLnZqhhDIn8YO5u3OxO+sTRRyfmH+uzUjcBib8m4Jf3
X-Received: by 2002:a05:6a21:e113:b0:3fa:ab6:3879 with SMTP id adf61e73a8af0-4014db64243mr14653579637.49.1795480534063;
        Mon, 23 Nov 2026 16:35:34 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:33 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] wifi: mac80211: one JOIN_MESH writes 479 bytes past the mesh beacon, because the extra IE blob is budgeted once and copied twice
Date: Tue, 24 Nov 2026 06:05:24 +0530
Message-Id: <20261124003526.78471-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hello,

ieee80211_mesh_build_beacon() sizes the beacon for the user's extra IE blob
once, and two of the builders that fill the tail both draw from that blob.  An
IE blob that begins with a vendor IE and contains an RSN IE after it therefore
has that RSN IE emitted twice, and the tail copy runs past the allocation.

One NL80211_CMD_JOIN_MESH is enough.  Reproduced on net.git main at
af6737b90668, 7.4.0-rc3-01164, with KASAN.  A two-patch series follows in this
thread.


1. Root cause

net/mac80211/mesh.c, ieee80211_mesh_build_beacon():

	tail_len = 2 + (IEEE80211_MAX_SUPP_RATES - 8) +
		   ... +
		   ifmsh->ie_len;            <-- the blob, counted once

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);
	/* need an skb for IE builders to operate on */
	skb = __dev_alloc_skb(max(head_len, tail_len), GFP_KERNEL);

The tail is then built in an skb and copied in:

	skb_trim(skb, 0);
	bcn->tail = bcn->head + bcn->head_len;

	if (ieee80211_put_srates_elem(...) ||
	    mesh_add_rsn_ie(sdata, skb) ||          <-- reads the blob
	    ...
	    mesh_add_vendor_ies(sdata, skb))        <-- reads the blob
		goto out_free;

	bcn->tail_len = skb->len;
	memcpy(bcn->tail, skb->data, bcn->tail_len);

mesh_add_vendor_ies() emits everything from the first vendor IE to the end of
the blob:

	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;
		data = ifmsh->ie + offset;
		if (skb_tailroom(skb) < len)
			return -ENOMEM;
		skb_put_data(skb, data, len);
	}

and mesh_add_rsn_ie() searches all of it:

	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);
	if (!data)
		return 0;

	len = data[1] + 2;

	if (skb_tailroom(skb) < len)
		return -ENOMEM;
	skb_put_data(skb, data, len);

Put a vendor IE first and an RSN IE behind it, and
ieee80211_ie_split_vendor() returns 0: the vendor builder copies the whole
blob, and the RSN builder copies the RSN element a second time.  The two
together exceed the one ifmsh->ie_len the beacon was sized with.

The skb_tailroom() tests in both builders do not catch it: the skb is
allocated max(head_len, tail_len), which is larger than tail_len whenever the
head is the bigger of the two, so the builders have room the destination does
not.


2. Impact

A heap out-of-bounds write of attacker-chosen bytes - the IE blob is the
attacker's own - immediately after a kzalloc'd beacon_data, from a single
netlink command.  It needs CAP_NET_ADMIN in the owning netns and a
mesh-capable device, which a user namespace plus mac80211_hwsim provides.

The length is the attacker's choice up to the overrun, so this is a
controlled-content heap overflow rather than a crash: KASAN stops it, an
unprotected kernel does not.


3. KASAN report

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-mesh-beacon-oob-write-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-out-of-bounds in ieee80211_mesh_build_beacon+0xe3f/0xf00
  Write of size 479 at addr ffff88805ca1887b by task x/9448
   __asan_memcpy                      mm/kasan/shadow.c:106
   ieee80211_mesh_build_beacon        net/mac80211/mesh.c:1110
   ieee80211_start_mesh               net/mac80211/mesh.c:1187
   ieee80211_join_mesh                net/mac80211/cfg.c:3330
   rdev_join_mesh                     net/wireless/rdev-ops.h:361
   __cfg80211_join_mesh               net/wireless/mesh.c:214
   nl80211_join_mesh                  net/wireless/nl80211.c:15399
   genl_family_rcv_msg_doit           net/netlink/genetlink.c:1114

The same reproducer on 7.3.1 gives the same write at the same source line
(kasan-mesh-beacon-oob-write-7.3.1.txt).  net/mac80211/mesh.c is
byte-identical between 7.3.1 and af6737b90668, and nothing in the 34 commits
between af6737b90668 and today's net.git tip touches net/mac80211 or
net/wireless.


4. Reproducer

mesh_join_rsn_after_vendor_oob.c in this directory (sent off-list on request;
see the note at the end).  It loads mac80211_hwsim, puts the interface into
mesh point mode and issues one JOIN_MESH whose NL80211_ATTR_IE holds a vendor
IE followed by an RSN IE.  It faults on the first attempt on both trees.
CONFIG_MAC80211_MESH, CONFIG_MAC80211_HWSIM and KASAN are required.


5. Suggested fix

1/2 confines the RSN search to the non-vendor part of the blob, so the two
builders cover disjoint ranges and their total cannot exceed ifmsh->ie_len:

	+	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
	+	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

That split is safe to use as a length here: the blob has passed
validate_ie_attr(), which walks the element chain and requires it to end
exactly at the end of the attribute, so the result is an element boundary not
past ifmsh->ie_len.  An RSN IE behind a vendor IE is still emitted, inside the
verbatim vendor range.

2/2 is not a memory-safety fix and can be dropped if you would rather take
only the first: the same two functions hold u8 values derived from a size_t
length that reaches IEEE80211_MAX_DATA_LEN.  `offset` in
mesh_add_vendor_ies() truncates for a blob whose vendor IEs begin past byte
255, so the copy starts inside an earlier element; `len = data[1] + 2` in
mesh_add_rsn_ie() is 257 for the largest RSN IE and truncates to 1.

Both patches carry Fixes: 2b5e19677592 ("mac80211: cache mesh beacon"), which
is where the single budget term and the two builders arrived together.  Cc:
stable is on 1/2 only.  Checkpatch is clean on both.


6. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched kernel
is clean on the same reproducer; a secure mesh whose blob carries the RSN IE
before any vendor IE still beacons with the RSN element present, with the
patches applied; mesh.c is identical between 7.3.1 and the current tip.

Not checked: real hardware - this is mac80211_hwsim under QEMU.  We have not
measured whether a mesh peer can be made to accept the malformed RSN element
that 2/2 fixes.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
