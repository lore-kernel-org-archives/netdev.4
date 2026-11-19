Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108901;
	b=xZfR+t2ECRdxYTXMSclAw1/4PCUXpScRJyqHeuR4F+jj93A8DuinZ3IXPg4YqkWGXSFf
	 K8NwjrkxDgy9mFZfF8hC386cSOz2kZN3zndNvTNaKxuk6nlAi8ydZcninSOxMztphrgDT
	 zKRLGK+dPHinPcC0kTAmibRIr63oE05HHoX4OwXjmy+4oJsUq2qXQ2ETI5oVwP3ajKXE7
	 nd0Bjkiyec/n+nfvuA56OPAEVpb1sTVsH8m9xVtC7XDl3ry7SUAeHUZY4Ts4N5+BP38ha
	 AOFnLqbBEiW/b9k5E4bHl0HZFC8yo7hCWFvQ/X50UMmI4qQksWXFy+U+hDOpcPCzP4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
	b=Q2JilFjYPTi5S+aI1cf7Jtk77gA6lL/4hEtCSogFOl77RApvRvUG0QIxxHaa1FWf6Fiy
	 pil+1c0bv7MgGbWqfic1Z5Yb2wApyC1KrWiAp/obvLt28dleDvqxlibOToYFsu2I4KsEO
	 bs2ZKSoClt0irAH1NgkBeI5Qge11t+T47B4hO/uUEthIQ0J9dTwNejQB4V5FdT7gBfO0g
	 X3u97RG6raSV0vX6xGYQS94lbUktAclWx1lSI+H3NaaTR1RPTxjj7+c7jXl9UOnzI7Bdq
	 ntOXuHCJAqnt+HXTwBwh+K6DB7dWVxb6Csvea0nfkUfJqBPd16zIbiyUp8uujaU3WrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktueSXbA;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54A60A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B54A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktueSXbA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so6852492eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108900; x=1795713700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
        b=ktueSXbA/ZK8w1FOrycdueYk9CnEr4f8UDjqiKQUYHPD/t3QQL/I3+RH4/oN6rSZSx
         8IcBjOwWfutR9gziS7oUOTJHZv//J5lPFAZsSOoIVhKMC7TnsF6Vcfs4/O4dwNwk5/Kt
         2a9JqGyWcOWChOwEzliUhzG+6MqcKUVMSri/WzuNw2sG1WIH8A1S5gqxD4ersL8nKV3G
         qmTZbMGPpY/zA4GkBnjC/yKRHERDmJ9Oxwr5bSXlDmIvy8bSWwGx0T/9+GAEHdp31MiB
         aC24Y8mEwDCcBEvftng+ynsnWjLV1JbpnWe80DPgo3YetsjwItD+X8qkcfIyLIxQ6Jkn
         r6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108900; x=1795713700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQKbJ2g0yFvI6L7amYGlUpDcsx4Luz+GqUAbZE0UNg=;
        b=As3XyIo/4uctSFh3ym895Dn3YdHgSBcxIxwkYULHm0gWUsWrPzy2bN3JTjL37NwoZb
         6aZY99YVDiTZ7RtglwJegx28HJ4LvMTfSy4oVWEiOHVzjQVSpJimAIAJiXKASfQvJ4jm
         1q71dZT9/W7O6QJzPWQYJcMXMtFmR3sUu6J5o1EixRRA7B+kCXs4v1lrwM7aCvGVXpHD
         Flv1P9YvyxVg3arenDfM746I07OByVf+VEdCtikuI7OhOEU922pFPK4iuquB3Id2laUH
         k1VuyfXp8VzEfqEYRkybsqM63XRSnxypKs727IRSWjbmIUhIIJnA8tlCjHgPODephreT
         ofxg==
X-Gm-Message-State: APuU4Z+3LVi4xvZEYQ3xKOvWS7vWver3rIbnwhAHAwZZWzrK2GJKc6S/
	F9/18VDYc8/2vwxlBngENwloQSHs1pIPcPEknerS+3ZJBKXjlQcjFCcmKOMbQkMH
X-Gm-Gg: AZFdTZecgC3faF5v6YPmiw/kX4doGjJ5kL+lPIN6ZJS9xugYV+qJXv6ixAxIC95z6Xj
	EQ6b5NZdHI/+E6P1lOv4WcJWBJQQcgNllbT3750zeVo7KQIfLQf0YIpHIdd3tK91lka2pPtFWF6
	BSNIJa87fqoeEIwog4dn7DFWn+525UNRF0wq5R5qj+pE388tnw85haue0pbZbVPQ5gqD9pa/mxH
	2QAHtVmzLjZVybzdTc9vLANxNVS8HAEc7diEvQAHqqVYFVzIi+R21SjuMPCLfnMoI1FGHbYNHQL
	vPzMhrBf+/Hj0h6ToPfvrJNt3CAdQgRT69s9S+rs13MMJ8pssW2Sryw8JWTlsu9xZxrOtx50WNc
	2U1E4lF3AIxkUiaXwlvoHll/fWRmS5nPhtRUd8pcRamqkPL79mFzpuSkSl9VozP9+A33+zrxql9
	qtvpAA8alGcXpBVBnkYpqjvwPbdAQeYQXv4Lbknh2OL0A7kFi+AV4prFxJ+yIs0DC0GK4JxqG2Y
	X2ws9IsN3LduqbcksU40XA5DyTL17JHqAUTJaVvwGfbwlgX83WEf6fWqRdMBeYoecEdkvt/6h+K
	jA5mRJFcwfijBsJ8rLfctjaF
X-Received: by 2002:a05:693c:4152:10b0:37f:4fda:1a85 with SMTP id 5a478bee46e88-3857025f271mr23165eec.16.1795108900173;
        Thu, 19 Nov 2026 09:21:40 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672cf745sm226887eec.18.2026.11.19.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:21:39 -0800 (PST)
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
Subject: [PATCH net-next v9 2/3] netlink: specs: add ovs datapath and vport set operations
Date: Thu, 19 Nov 2026 12:21:17 -0500
Message-ID: <20261119172118.3416958-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119172118.3416958-1-houminxi@gmail.com>
References: <20261119172118.3416958-1-houminxi@gmail.com>
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

Both families register a SET command that the spec never described, so a
YNL client could not change an existing datapath or vport. The datapath
NEW command also gains the masks cache size, the per-cpu upcall pids and
the ifindex, which its handler reads. new, del and set take
CAP_NET_ADMIN, which is GENL_UNS_ADMIN_PERM in the kernel.

The datapath SET command changes the user features, the masks cache size
and the per-cpu upcall pids. A request that leaves out user-features is
read as zero, which clears the features set earlier. per-cpu-pids takes
effect only when the same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU
in user-features; without that bit the pids are dropped and the request
still succeeds.

The vport SET command changes the upcall pid. It finds the vport by name,
or by port number when the request carries no name. An ifindex or options
are rejected with -EOPNOTSUPP, and a type that differs from the vport's
type with -EINVAL; nothing is compared but the type. The vport NEW
request list gains the port number, which its handler reads.

The ifindex attribute is signed in both policies, which read it with
nla_get_s32_default() and reject anything below zero, so declare it as
s32 to match them rather than leaving it u32. The field in the generated
reply struct becomes __s32 with it. The reply itself does not change:
ovs_vport_cmd_fill_info() still puts the value as u32, and the two types
have the same width.

The commands in both families skip strict and dump validation in the
kernel, so the spec says so for get, new, del and set.

Both SET commands also send the updated object to the family's multicast
group, and to the requester when the request sets NLM_F_ECHO, which the
new op docs say.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/netlink/specs/ovs_datapath.yaml | 37 ++++++++++++++++++-
 Documentation/netlink/specs/ovs_vport.yaml    | 31 +++++++++++++++-
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_datapath.yaml b/Documentation/netlink/specs/ovs_datapath.yaml
index f7b3671991e6..6232760224dc 100644
--- a/Documentation/netlink/specs/ovs_datapath.yaml
+++ b/Documentation/netlink/specs/ovs_datapath.yaml
@@ -108,7 +108,9 @@ attribute-sets:
         sub-type: u32
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
 
 operations:
   fixed-header: ovs-header
@@ -119,6 +121,7 @@ operations:
       doc: Get / dump OVS data path configuration and state
       value: 3
       attribute-set: datapath
+      dont-validate: [strict, dump]
       do: &dp-get-op
         request:
           attributes:
@@ -135,24 +138,54 @@ operations:
       dump: *dp-get-op
     -
       name: new
-      doc: Create new OVS data path
+      doc: |
+        Create new OVS data path. per-cpu-pids takes effect only when the
+        same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features.
       value: 1
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - upcall-pid
             - user-features
+            - masks-cache-size
+            - per-cpu-pids
+            - ifindex
     -
       name: del
       doc: Delete existing OVS data path
       value: 2
       attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+    -
+      name: set
+      doc: |
+        Modify an existing OVS data path. The kernel treats a missing
+        user-features attribute as zero and clears the previously set
+        features. per-cpu-pids takes effect only when the same request
+        sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in user-features. A
+        successful set also sends the updated data path to the
+        family's multicast group, and to the requester when the
+        request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: datapath
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
+            - user-features
+            - masks-cache-size
+            - per-cpu-pids
 
 mcast-groups:
   list:
diff --git a/Documentation/netlink/specs/ovs_vport.yaml b/Documentation/netlink/specs/ovs_vport.yaml
index fa975f8821b6..af7ee56f5f90 100644
--- a/Documentation/netlink/specs/ovs_vport.yaml
+++ b/Documentation/netlink/specs/ovs_vport.yaml
@@ -111,7 +111,9 @@ attribute-sets:
         type: unused
       -
         name: ifindex
-        type: u32
+        type: s32
+        checks:
+          min: 0
       -
         name: netnsid
         type: u32
@@ -128,18 +130,23 @@ operations:
       name: new
       doc: Create a new OVS vport
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
             - name
             - type
             - upcall-pid
+            - port-no
             - ifindex
             - options
     -
       name: del
       doc: Delete existing OVS vport from a data path
       attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
@@ -150,6 +157,7 @@ operations:
       name: get
       doc: Get / dump OVS vport configuration and state
       attribute-set: vport
+      dont-validate: [strict, dump]
       do: &vport-get-op
         request:
           attributes:
@@ -165,6 +173,27 @@ operations:
             - netnsid
             - upcall-stats
       dump: *vport-get-op
+    -
+      name: set
+      doc: |
+        Modify an existing OVS vport. The vport is picked by name, or by
+        port number when the request carries no name. An ifindex or options
+        are rejected with -EOPNOTSUPP, and a type that differs from the
+        vport's type with -EINVAL. The type only has to match; the one
+        attribute that changes state is upcall-pid. A successful set
+        also sends the updated vport to the family's multicast group,
+        and to the requester when the request sets NLM_F_ECHO.
+      value: 4
+      attribute-set: vport
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - name
+            - type
+            - upcall-pid
+            - port-no
 
 mcast-groups:
   list:
-- 
2.56.1

