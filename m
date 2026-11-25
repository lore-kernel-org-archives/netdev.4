Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581502;
	b=y12GK3U6icYM6TpaaXn/RY1BmEYFgOOrZorhnsUZWd9SkJbmMKgojBhBp69jQXdLSKwR
	 1wh60zOND+S9Vnq/liqwe19DQWkAG4dH2TRYJS4E7OntTL5BkiSnkB352q8aKeOCtxtcf
	 xLKO/1D6qNhNVujNb53srp5txO4p/WI9AVYiJG3UwbAAQ9scBIS/3xfbrTiEOu3qdDJJ9
	 40ieJWf8e4+Zh1PzarBj1BYKTg7hFj21gSc7F0mKb6RRJ3Y0K8f9Q0LVyFuh2QTR/Q3l9
	 eesM/F5waXvczNUK34jnohttIgOJSHxZeh+kpSWjGARsi2Ce2pPeu3PTCyfBYR6d+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
	b=CwcYO5NwvEeRT9kvoZSM5cT1tkMU+0hlnIACON9Y08x4OR8naCIe8evoHgcBhPxs3tIG
	 SaR5U/5LYzwyKctZOoeugKe4utRroSX+9HZyjVg11vD+l99Y61PFQ1psL6rkCw8tRR4hS
	 IYtwSNSxnn3H+QoufrbG1AMA3RrjIEFjQMLBMiGJ1i3kfLhsApAq3MJqrPjZ3I6hwKOKi
	 7OSQGcokzemdiGP6BZJVRmpQJw76O3USFYzULDs8zqYyHUZqDWQGqTtZ3PdDjDJ/SPRL3
	 szs1LTGACeVtC70AZ7OEGsDhqg8jMCKbzHc4sAuowJHAtYAzbL9fLO2fo4TWOcVmNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=iyObN45M;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA1606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=iyObN45M
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f037bc348dso42671695ad.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795581496; x=1796186296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
        b=iyObN45MJgSxqtlageqtgYM5837oiaIJ5+bs0qPevJBMaCNHqUnWeShu0jRy5dmA0j
         5mGfFnENTfbpmsauuhF6jVGaSZjj0lqeDdiPTX1woD3jiAf5uRd09IFuo1ACxoziIZns
         haiRHfYJ2i3O2KrAaRW6U9bsR5Y2HPCJHyUCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581496; x=1796186296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
        b=ffGtNdML/OIW7vY3EAOAVyTX65fnmHR08TLqnOrs+S5peW76auzQWjz3YZ8LidK3Ff
         wGph5RInQWd/LeB5UHwAYQ5gpSBuA/u0RRpb24Ax/z6JgVADF4O4GWx3+QLglr9E9dI6
         yETE0XecHq/mVjmgCDMcURVHmFgFgVjPzG/ZozeeJyt5mdgC5XCEzlf1ZgbP9eLe4zT2
         SM7WambOS1LZuFI6/kn+jQ0kebezN/L0lmUCDuRMfupFko5B2XUPgPc9L/5Vto8E9SKw
         LuGwPNVCv88lGEYCmdu9HlZdN8PVeEOWtZoAyCA6B02kfUb0wdaakqdjiYQuHEC8Pfcp
         AO1A==
X-Gm-Message-State: APuU4Z8hTmawuWogBxhGZg1CA9MWYLJbwK4TEAljChLa+BMr5BWucoGM
	k4MnaCCr42DggBnYksRMRd6jhcVsVfG77TIehiPzyVRHyaqowKklA/yNXmD5RP2ytPU=
X-Gm-Gg: AZFdTZc4SdOI5WcgEHZsveihQDo2ak+8+F+5S8k7tdiqfccud29a1uok7xlZKagHKqX
	nhXHjAAA4iCcAfdrSh+y9aO22/RbCgX+SroMtWSvQm0rToKvbkehPCeblXlj5R9jr2uJuwFZy9y
	U4AFD59scHAxRPBlX2imAORDh6koFIsow4urfaXm6ymhxOpnELBuanOo/PzaFY9Z0BlJjy0KA+g
	XJqIlAQp9Dz6KzP1NnlGdvXP+ML5BgyNHrhT8Tv+h8BvI+NlZeRcqfbDEqrR+h+KFFSv9pbjSFi
	QHW5X6qfCIVdDcZTOAgh1FDiuIH+PcbggVODin2N4XZjc4Q9PlaFUAKR+xagrrqYNjrdk99g3XT
	k0vFTGfxNeeWNq9NtTmPww3T32xhnz0+iPSt4jsecplXSXF73xihPdYVh/vONWeBRVmPSwRVbpQ
	kvNPXcH7/YDcwCpA2wrcy3Kwd7lQfEHoJQB2Sfn6P5olfAPocFkpQ8XZRLMI6qNisQ1VxwxxEdk
	l/4lvulTzxBkSY29ZPfGXEkC7R1TRDRttb0LvTszotHCuksdJzKh6PXM5MzClvwkyrSON43QvCH
	Kc2vTz+LwE1gzi6eXl6jAQkFatuMKwdrhlX7PjlopuKy/NW4hv6E8wzdz2f//o0eZlmR8QVbS4z
	eYD6sGPoeFepW5YMY05GUfbCXhousjkrP7Xie7/rj/aBasA8oHlnaLpV4mZvTdR6q
X-Received: by 2002:a17:90a:d2c7:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b41c95da5bmr15165176a91.55.1795581496295;
        Tue, 24 Nov 2026 20:38:16 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm10736254a91.1.2026.11.24.20.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:38:15 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Wed, 25 Nov 2026 10:08:11 +0530
Message-Id: <20261125043811.884090-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179557011763.3135.4931211502666684623@kernel.org>
References: <179557011763.3135.4931211502666684623@kernel.org>
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

You are right, and the Critical one is right in the way that matters most:
the patch added a second route to the overrun it was fixing, reachable
without any vendor element at all.  Thank you for catching it before it went
anywhere.

All three points were checked against wireless.git at af6737b90668.  v2 of
this patch is posted as a separate thread:

  [PATCH wireless v2] wifi: mac80211: do not copy the mesh RSN IE twice
                      into the beacon

Only this patch is respun; 2/2 drew its own review and is answered in its own
thread.  The v2 changelog is under the --- line, with a Link: back to this
posting.

Point by point.


1. [Critical] Can prefix end up larger than ifmsh->ie_len?

> So it returns pos > ielen whenever ielen ends in the middle of an element.
> That can happen because ifmsh->ie_len is still a u8 in struct
> ieee80211_if_mesh, while the policy allows NL80211_MESH_SETUP_IE up to
> IEEE80211_MAX_DATA_LEN (2304) bytes

Yes, and every step of that holds.  Checked in order:

  ieee80211_ie_split_vendor()   net/mac80211/util.c - advances
                                pos += 2 + ies[pos + 1] while pos < ielen,
                                so a length that ends inside an element
                                makes it return past that length.
  struct ieee80211_if_mesh      ieee80211_i.h:829 - "u8 ie_len;".
  struct mesh_setup             cfg80211.h - "size_t ie_len;".
  copy_mesh_setup()             cfg.c:3449 - "ifmsh->ie_len = setup->ie_len;",
                                size_t into u8.
  the policy                    nl80211.c:10888 - NL80211_MESH_SETUP_IE is
                                NLA_POLICY_VALIDATE_FN(...,
                                IEEE80211_MAX_DATA_LEN).

and the write lands exactly where you say it does:

	bcn->tail_len = skb->len;                      /* mesh.c:1109 */
	memcpy(bcn->tail, skb->data, bcn->tail_len);   /* mesh.c:1110 */

bcn is kzalloc()ed to the PRECOMPUTED tail_len while bcn->tail_len is taken
from what was actually assembled, so anything the emitters put in the builder
skb beyond the budget is copied past the end of that block.  Your 257-byte
example is right: a 255-byte RSN element leaves ifmsh->ie_len at 1, the
unclamped split returns 255, and 255 bytes go into a one-byte budget.  My
commit message asserted "the split returns an element boundary that is not
past ifmsh->ie_len", and that assertion is false.

> Would prefix = min(prefix, ifmsh->ie_len) fix this?

It does, and v2 is exactly that:

	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
	prefix = min_t(size_t, prefix, ifmsh->ie_len);
	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

Two things make it sufficient on its own, and the commit message now says
both rather than leaving them to be rediscovered:

  - the clamped bound is never wider than ifmsh->ie_len, which is the bound
    this search had BEFORE the patch narrowed it.  So whatever ifmsh->ie_len
    happens to be - truncated or not - the patch cannot make this copy
    bigger than the unpatched code's could be.
  - cfg80211_find_ie() returns only an element that lies wholly inside its
    bound: for_each_element() requires sizeof(*elem) + elem->datalen to fit
    in the length given.  So len = 2 + data[1] cannot reach past the bound
    either, and the skb_put_data() fits the budget.

> It would also need either ifmsh->ie_len changed to a size_t, or
> NL80211_MESH_SETUP_IE capped in the policy at what mac80211 can store.

Agreed that the truncating assignment is a bug in its own right - a
configuration is silently stored with a length that does not describe the
blob - but v2 does not need it fixed to be safe, for the first reason above.
I have left it out deliberately rather than widen a struct field inside a
patch whose subject is the double copy.

> The follow-up commit "wifi: mac80211: widen the mesh IE offsets a u8 cannot
> hold" doesn't appear to fix this. Its commit message says "ifmsh->ie_len is
> a size_t", but the field is still a u8 at the end of the series

Also right, and worse than a wrong sentence: that patch widens the LOCAL
variables in mesh_add_vendor_ies() and mesh_add_rsn_ie() and does not touch
the field, so the message describes something the series does not do.  It has
its own review and I am answering it there; whichever of the two remedies you
prefer - the field to size_t, or the policy capped - belongs in that patch
rather than this one.


2. [Low] The wrong netlink attribute

> Is this the right attribute? nl80211_join_mesh() doesn't seem to read
> NL80211_ATTR_IE.

It is not, and it does not - nl80211_join_mesh() has no reference to
NL80211_ATTR_IE at all.  The blob is NL80211_MESH_SETUP_IE, nested inside
NL80211_ATTR_MESH_SETUP, stored by nl80211_parse_mesh_setup() at
nl80211.c:11071 and kmemdup()ed by copy_mesh_setup().  v2 says that, and as
you note it is not pedantry: it is that attribute's policy that admits
IEEE80211_MAX_DATA_LEN, which is the half of the Critical issue the u8 then
truncates.  The reproducer in the report thread sends the right attribute;
only the prose was wrong.


3. [Low] The peering frames

> mesh_plink_frame_tx() in net/mac80211/mesh_plink.c also calls
> mesh_add_rsn_ie(), so this patch changes Mesh Peering Open/Confirm frames
> as well as beacons. Should the commit message say so?

It should, and v2 does.  mesh_plink_frame_tx() calls mesh_add_rsn_ie() at
mesh_plink.c:287, right after the extended supported rates, and
mesh_add_vendor_ies() at :349, at the end of the frame - so for a
configuration with an RSN element behind a vendor element, that element used
to appear twice in peering frames too, and now appears once, in the trailing
vendor block.

> and explain why it is fine to move the RSN element out of the standard
> element order?

The argument v2 makes is the narrow one.  Element order in a management frame
is not something a receiver may rely on: 802.11 parsers walk elements by id,
and mac80211's own do.  The alternative is to keep the in-order copy and
accept the duplicate, which is the bug.  And the only configurations affected
are those that put an RSN element behind a vendor element - the ordering in
these frames was built around the RSN element coming first, and such a
configuration is untouched.

If you would rather the element kept its position and the DUPLICATE were
suppressed instead - have mesh_add_vendor_ies() skip an RSN element it finds
in the vendor range - say so and I will respin that way.  It is a bigger
change than this one and it makes the vendor range no longer verbatim, which
is why I did not reach for it first.


Thanks again.  The Critical one was a real defect in my patch and it is the
kind that the commit message's own confident sentence was hiding.

pw-bot: cr
