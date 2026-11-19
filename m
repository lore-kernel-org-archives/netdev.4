Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108894;
	b=UTFuCpv32NmioPZHhUQDCMryIQF201mIN+Tc5/Fsj/7gDPXmCA1X3Bxw6Z5Xyk6xsr+T
	 8TW0tVGAd03Y80Ix110o9ztrz99w/APgX51lRqkoq8hUBD8Z/fl1l87nxzFy6o9mw4i9U
	 ZPKkg9IDpY53qr7gjalXlm1a+kQXiit4PdLYexMuBdkYR04U36KE8mI4g2iwI/itRLvJN
	 Vs38dgdGYB6ecHH8Gs+3I7qJE/8OW2V9aXuB+Tw1JmgrN91xZhhsMFAhHPytSE1LBv0C7
	 lCnP2o/EfQZhtCW8gHTEf0ggdtwbQ994H3pWIlY8ot7EgHrrBOLNp+vxk4f0Lcy3Vig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
	b=fwmlNJvy6HK5dtJMhUkBsuyMXf36lj+WOWDbL4VMEiOQPVUupiLir0HMvh8kTqrPXaLd
	 U0TTOZwvihhrRY73c/HhHPSEUUhEv56j4zAuWYOoyJD9kvLeQw2Dnl4PViNPv1Y6Kc2t8
	 4WHoBSLhYE4LT8gqnHIZ8Qhb146kFHnWQHwS2EXlcDUKIvFt37VxOVpkeer+YwyijclQR
	 3dr1dyGD50MdB7SaNOXD9pWZhN65wPEhFEIi0wmw/vWxwQ1g/Dne+MJv81a4Yu5rfafkD
	 sqGMbuepvki+evbI7MEGMJjQtqW/mkLdFfj6ueYEC1eQ3R67pwf6bn4XKamtAuneAkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWgvp8C9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB533606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB533606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWgvp8C9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-381d542bc29so4618521eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108893; x=1795713693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
        b=JWgvp8C9ETJ0rXuwu+LdsTSKhpUsjm+gZpH9+knFNaC3XWYyTO3Yv0h0xL3eBqhdVC
         /cjHKpbaJGIax2dpqc/Dgng7Gzybp8H9yOIdyU+9R2tAlOFeB0la1ap+qABoCh9n3MKh
         lpE0jLZD5bnVeqGABPV4A61qNa0BV0ImnxcztiiVtSGez/OuSLb2q60aNk3RG8Lo84F6
         T5p2KyH+D1DQ/XCIi6bTmpZjcRueL+VCIm4qqb5e+oL+MSoE4DDbQrOmb/mWlADv5vW5
         ofQxaf0wRVzHQl3wzRkqfWlD4AEW8EOgvJl26BkyLvo6fboF6nwzPmzkPZm1jVQSLsyV
         kUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108893; x=1795713693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
        b=RQN1T4ltMZq8TFXyBrTLX33y3CX9VwFGAgbuZkqKNfIesDhX4cARU06ro5yoemn4/z
         Ruva1fyQ2wx+VlzNqoLA3OzWFK6MbgFSyKm/4qpfVy9Kubs7P0sEuyonyrSLyg6WSNj5
         dyEIyudU9uoHAoF2xx5rINBRiuRnpIyOWUAP650WfVvqHYllFF2W3PkG0wLpRO+iLtrk
         GTF1hHvmWR3cQ6Uh0SxsPwjd2njvAbzOK7DI0u+AvEJeFWbyFUV515+WGvWYy/fxQigd
         9oqlyZDFrll+pbcs9vPWa2lYD3YBOkYXyCGBQ2/rBpwkn2EaKZCFJU2h7Uz6W0yEVU4u
         Gifg==
X-Gm-Message-State: APuU4Z/3Y00tm90SBthcncr8yFmQLwKTxczRv6N3s2l3LVYAJjmB69uz
	/f6oBqtMUTDotO/X0H8B07Cf/u3l/UkK83CrqG3Q6+oqA6+YrPyBHj30BDBaB4nQ
X-Gm-Gg: AZFdTZeQXaUmAL5q3xuUGftAS07hUB5xOemTmkUQXYXZxj5SS1KpmzQu0atW2YtSlgq
	pzvltDSahZQ29CKETPnj8bKVF4n9H6fdTnTJ6iJ8MuJ45AT8EvIHYxSDPWhY6QwkSqYY8q8+lzn
	dX2/neN7x3hWAJBY6be43poAveEOm0AEIKQdEWxbEPPgbNGzQjvGsP8DqDbfiAhliIDLwZTfDsd
	XMqfIt+8Pb7MWJaaN+0uNnmM09RhVTSr+9GxaN+AbuL5wttb7ohTdBArQ0hvz7l+E5ou5YY4TO7
	f86l4KwSLXkzlqdI6HjowxMUC0gfEGh7oAg2imZ41KDvMX4PFNaV/VG5JJyS5VvdXbCx5T41Kja
	EI5lpFKKs1CnhlRnXyDwL2guxGJN1Jno1o3OVxAknMPPCO0yTkOD9BQ1S9nKwYZVIEB2RxsPcen
	b4Qi6BwKSoOywZ3bveQBE784Kx2f6bAe8YtPvTCsc7UwWzBKCG+4OpCSSnFByC4auEVn6u1mDCw
	rfGayaCZp/svItX/1c0vu03vr+XLn4919SgqxgUl974GWtYvNlzoQTDryCJ0xneG2L2jKLsklDU
	o+33yJ58G9+GLLHlFd32gJJI
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr28905eec.20.1795108892707;
        Thu, 19 Nov 2026 09:21:32 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672cf745sm226887eec.18.2026.11.19.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:21:32 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	dev@openvswitch.org
Cc: Aaron Conole <aconole@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v9 0/3] netlink: specs: fill in the missing ovs operations
Date: Thu, 19 Nov 2026 12:21:15 -0500
Message-ID: <20261119172118.3416958-1-houminxi@gmail.com>
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

The ovs specs describe get and new but not every command the kernel
has registered: all three families lacked set, and ovs_flow also lacked
del. This series adds them, names the attributes each handler reads,
and corrects what the existing specs say about the kernel. No kernel
code changes.

v9:
https://lore.kernel.org/netdev/20261115072638.3163018-1-houminxi@gmail.com/
  - Rebased onto current net-next.
  - The note on the vport name is a complete sentence again. The v8
    wording stopped after "dp_ifindex from", so the sentence that says
    what the lookup falls back to was missing.
v8:
https://lore.kernel.org/netdev/20261110174751.973464-1@gmail.com/
  - The datapath spec no longer puts a maximum on masks-cache-size. The
    generator does not turn a check into a policy for these families, and
    the kernel bound is an expression, so the declaration promised
    something the spec cannot express.
  - The docs no longer say what a dump does with a key, a ufid or another
    request attribute. A dump now has its own request list for each family,
    which states what it takes, so the sentences that repeated it are gone.
    The ufid docs record the minimum length the policy sets, and the key,
    actions, stats, used and tcp-flags docs say the attributes appear in
    replies as well as in notifications.
  - The series gains a third patch for gaps that predate it. The vport
    netnsid is signed in the kernel. The two dumps stop sharing a request
    list with their get operation, and four lists named attributes their
    handler never reads or sends. The vport get request can be answered by
    port number, and the vport new doc says an ifindex needs an internal
    vport. The vport spec declared family version 2 where the kernel
    registers 1.
  - That patch also declares what the kernel registers: all four ovs specs
    document the header struct and none of them a member of it, the vport
    name note names the header member the lookup uses, the options note
    says what a set returns, the packet execute operation gains the
    validate flags and the admin permission, and the ynl selftest stops
    printing a field the datapath reply does not carry.
  - Deleting one flow sends that flow to the family's multicast group, a
    flush sends nothing, and the set operations do the same for the object
    they change, which those op docs now say.

v7:
https://lore.kernel.org/netdev/20261107120647.874906-1@gmail.com/
  - The ufid docs said a value outside 1-16 octets is read as absent, and
    that a dump ignores the attribute. Only a value longer than 16 octets
    is read as absent. A zero length value fails the policy check before
    the command runs, and the request fails with -ERANGE; a dump accepts
    the attribute and does not read it.
  - The del and key docs said that a del with an out of range ufid
    flushes the data path. That only holds when the request carries no
    key, which the text now says.
  - The get reply list names the last-used time and the TCP flags, which
    ovs_flow_cmd_fill_stats() fills for get and for dump, and the docs of
    the stats, the used time and the TCP flags now say replies and
    notifications rather than notifications only.
  - The vport set doc says what the command does instead of explaining
    why two attributes are missing from the list, and says that the type
    only has to match.
  - The datapath new doc reads as a sentence again, the masks cache size
    records its upper bound of 4096, and the vport new request list gains
    the port number, which its handler reads.
  - Patch 2 says why ifindex is s32, which is to match the policy and
    nla_get_s32_default() in the request path, and that the generated
    reply struct follows with a __s32 field while the reply itself keeps
    putting the value as u32.

v6:
https://lore.kernel.org/netdev/20261103183319.2730567-1-houminxi@gmail.com/
  - A del flushes the data path when it carries no key and no valid ufid,
    not when it carries neither. The kernel reads a ufid outside 1-16
    octets as absent, so such a request flushes as well. The ufid doc now
    says that, and that a new request with such a value indexes the flow
    by its key instead, and the attribute records the minimum length the
    policy enforces. The same sentences in
    include/uapi/linux/openvswitch.h follow.
  - ifindex is declared s32 with a minimum of 0, which is how both
    policies read it. No request used the attribute before this series,
    which is why the type went unnoticed.
  - The ops skip strict and dump validation in the kernel, so get, new,
    del and set say so in all three specs.
  - Rebased onto current net-next.

v5:
https://lore.kernel.org/netdev/20261025103409.3519874-1-houminxi@gmail.com/
  - ovs_flow dump gets a request list of its own with ufid-flags. It
    shared the get list, which offered a key and a ufid the kernel
    ignores on a dump. The reply is unchanged.
  - The key, actions and ufid docs no longer claim those attributes are
    always present, and say what the exceptions are: a ufid-identified
    flow sends no key or actions when the request asked for them to be
    left out, a dump leaves the actions out when they do not fit, and a
    dump ignores the ufid. The same sentences in
    include/uapi/linux/openvswitch.h are updated to match, since the
    spec text was copied from there.
  - The key doc now says a get and a set need a key or a ufid, that a
    new request needs a key, and that a del carrying neither flushes the
    data path.
  - The ovs_datapath new and set docs say per-cpu-pids takes effect only
    when the same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in
    user-features.
  - The ovs_vport set doc says the vport is picked by name or by port
    number, names the rejections in the order the kernel checks them,
    and says upcall-pid is the only attribute that changes state.
  - Rebased onto current net-next after the merge window.

v4:
https://lore.kernel.org/netdev/20261015024132.698658-1-houminxi@gmail.com/
  - ovs_vport set lists port-no and ifindex. lookup_vport() finds a
    vport by name or by port number, and returns -EOPNOTSUPP as soon as
    it sees an ifindex, before the type or the options are looked at.
  - ovs_datapath new lists masks-cache-size, per-cpu-pids and ifindex.
    new calls ovs_dp_change(), which reads the first two, and reads
    ifindex itself.
  - ovs_flow get lists probe. ovs_flow_cmd_get() reads it to decide
    whether to log.
  - The key attribute doc now says a new request needs a key even when
    it finds an existing flow and replaces its actions, and that a dump
    reads neither the key nor the ufid. A del with neither flushes the
    data path, and the del operation doc says so too.

v3:
https://lore.kernel.org/netdev/20261012065552.2426415-1-houminxi@gmail.com/
  - no change since v2.

v2:
https://lore.kernel.org/netdev/20261006130533.1620706-1-houminxi@gmail.com/
  - ovs_flow new lists ufid-flags and probe, which ovs_flow_cmd_new()
    reads.
  - The commit message now says probe changes from binary to flag, and
    that new needs CAP_NET_ADMIN.
  - The key attribute doc no longer says a key is required for every
    request except a dump. get, set and del accept a ufid with no key,
    and only a new flow needs a key. A set that replaces the actions
    still needs a key.

Signed-off-by: Minxi Hou <houminxi@gmail.com>


Minxi Hou (3):
  netlink: specs: add ovs_flow del and set operations
  netlink: specs: add ovs datapath and vport set operations
  netlink: specs: correct the ovs specs where they do not match the
    kernel

 Documentation/netlink/specs/ovs_datapath.yaml |  53 +++++++--
 Documentation/netlink/specs/ovs_flow.yaml     | 110 ++++++++++++++----
 Documentation/netlink/specs/ovs_packet.yaml   |  20 +++-
 Documentation/netlink/specs/ovs_vport.yaml    |  55 +++++++--
 include/uapi/linux/openvswitch.h              |  51 +++++---
 tools/net/ynl/tests/ovs.c                     |   5 +-
 6 files changed, 227 insertions(+), 67 deletions(-)


base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.56.1

