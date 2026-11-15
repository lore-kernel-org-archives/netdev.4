Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727613;
	b=PFIznL/Aq2aF2G9bSFlDsnlXKat4NvF0EdPED7+evhz4G9EfGt1VDscLygWQnMBNSi4M
	 77pfVAMGLnFgjVwXO8N7YgkULlS5az7q0NxYPC8tRnJpHe4BBUH/88QUD3vsDvRSoTAh5
	 b+pEWbcz6zmgSYeZBvXYMoGMprYhZd49dfji/t3y/6CVwTFbWeCHK4ZiPFursk/bTPBJG
	 y69joIMZHor/Li4yGPQ3vi4Q+beqrUiszVFKQWX85WWNESmqvPuj0YOVHDpKJpXX9sy6n
	 0W3eLLOpY93HxS189HX342JlhQ/Ddw8fl1QMcjubJk8jMhPbI/AkX5ynZCSEMxQVn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RqV5Pn31nh6rVSoDOgxnXvy8gKDrwMayoWlNy1d/P/E=;
	b=Wpej57QmbTK3Hg+/iRsF7fMd298eMVgifxvlPd0TkQ/1t0ooely5hXrhnNuhFkFkzRjZ
	 jmjYVg3+2NX2qDLk9uI6KQUfXR9oxxMRaF2y4SVQnYYbuYe/XLfe6hp/6UvJeVxlsUjdX
	 cKM3xwnMDqWVzhi3pxAjhRH8n9UWhW4nKVVq9gnCBYiwz9b+a5mrhAvpfq6QhKAd+ARgT
	 SOwvCKwR4128fkP7t3vwiegPaz4n8sP+MTwNmrtrlzG5rijLz2JBOruWCyW8GYbCmJ5G0
	 jlikD95gy5KN4znJ1OTy/Ita5ZWHn4dv+PPJ4TK3vZLmy/Q96Jw8gyqY5to1quGhLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vz6zvDSo;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E089606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E089606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vz6zvDSo
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so3470385c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727612; x=1795332412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqV5Pn31nh6rVSoDOgxnXvy8gKDrwMayoWlNy1d/P/E=;
        b=Vz6zvDSo3pit8VTeab090Rvyr/QAmgAF7veALX+RNrcOCCvSxaHNV4d/924+IXEnFJ
         RWWNZQZ11ajlkJCM02sUTKqviajWdjGAWgpxfNBWqd+V3Q8ieLRISAAC8ibdbVm7Qlbd
         kUdrPwz6tEkvEYtyzbZO4utGkMlr5yBqZhG1z0fU8AZMoBcTO1+VsWiB4KZp46cgwnIa
         aigHerxAHLz7hoMHbVeFC++rDn3iRpyAF7bTe57I3YZr0DZRCNPKbTYWfpe0vc+tdLXU
         t8tSYE4n2Caom+ylZwKkrDC26e3jcGuOZ94+oyW87Srypl6HJXZN88laT0dwyUW+zg8b
         vHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727612; x=1795332412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqV5Pn31nh6rVSoDOgxnXvy8gKDrwMayoWlNy1d/P/E=;
        b=tnBWutnul/cVHJiYdtW32uUbjZYGRSFsRt323VO+89vsPb+k8Oo0dmBqZlt1MCbS6F
         Nupqgcl8N+WkEQMShkvE+awmT8znv9KIkV3aRlDlvP6wLidzKrmfAtHtEjjjbyUjYfL3
         no7gOfNGpicCAJeLKF4K6tMKgDDilCG1EDhJCtjg2bKgyGLysPIPKF2FhX4XDVDZtEg9
         UGioAMgEE/gvq2jis3UwwMGWnUQeBecj+xni6kIhDY6soNTSgO2M4x21P2jUXu7e723v
         Z1UY77+AkDZGjXamZ4quKkds1KwAJCo7DdB8iI3d1raTBr4QJe0BrAhY8tzA4weYrXLb
         4ilg==
X-Gm-Message-State: APuU4Z+Cag2zrorHm52twkOOwjNn/TH+pe+M7M6Q+9sahwjCUfrn3h5u
	SEtNlki1Fsqd5vvlOCkK/LNVBxfgBhcFMmAl2ZrCKCNLY/nQS5eESz0jltzQbszx
X-Gm-Gg: AYBFou3/zFA/3aPxXDZwU4BbN2i/zYTOWekYiCs0kKLrtobG6FlEybJWO1vrUl51V4C
	sLzqSeEGknbLrusqtouwXxECSIwM69OT06nhfF01LiqbY/1Etcl7zXSFwczfEsF3vmLIdeChO59
	S1stPfZVOojR+qOQNaY2XqLQIhP9aHwClK7ea5TsqjHWUwN0za3Ke5fWKQeKRS/aXpWHH8bKPj2
	TBRpe2AU7Yk+to5PDphruWjgdRZ4WdSCrJwldGNKKJZxcrXgRfIF3b5aqXlpu3z13UJupEEyxYK
	TyYXgf+6OHIm0lTnDeByaUE/TmqHMChcZHUcAVPHX1Tc/g+RVjpusXRPP8sZ1pHucYJw6RU1sjK
	x5B+g9P5npesUz7nZMUxq+DmoTvk4BFe6FoYMcHNqzxyLk+DlM8L0DnsGqw751ueEppwm8rtBTA
	ndCkFiE8JXoTw4Ff8wCbznGo3Qjeuh7efDtctwJjoO7gftW7ffgzQMr0s3M3ZE21EsZSchTgk8u
	8JVJsOiCplT1WBXhC3CNLrXcNgYnO7iADPTs2pV+jLgLRZgsGO2QpObATLoGi56KUUhOipt3PIm
	vEXGbD2mcSwDCSMW++Le4a/C
X-Received: by 2002:a05:7300:2a9a:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-37966e3b092mr7202035eec.16.1794727612354;
        Sat, 14 Nov 2026 23:26:52 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm22411234eec.3.2026.11.14.23.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:26:51 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net-next v8 0/3] netlink: specs: fill in the missing ovs operations
Date: Sun, 15 Nov 2026 02:26:35 -0500
Message-ID: <20261115072638.3163018-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
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
and corrects what the existing specs say about the kernel. Nothing
here changes how the kernel behaves.

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

---
Minxi Hou (3):
  netlink: specs: add ovs_flow del and set operations
  netlink: specs: add ovs datapath and vport set operations
  netlink: specs: correct the ovs specs where they do not match the
    kernel

 Documentation/netlink/specs/ovs_datapath.yaml |  53 +++++++--
 Documentation/netlink/specs/ovs_flow.yaml     | 110 ++++++++++++++----
 Documentation/netlink/specs/ovs_packet.yaml   |  20 +++-
 Documentation/netlink/specs/ovs_vport.yaml    |  55 +++++++--
 include/uapi/linux/openvswitch.h              |  49 +++++---
 tools/net/ynl/tests/ovs.c                     |   5 +-
 6 files changed, 225 insertions(+), 67 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.0

