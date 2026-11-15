Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727617;
	b=ZgnjeFDOVdaDWCjip4rY+1EsKjJx7arQKWA70uWRerYVWTpVlab/TVw+p8/xTi9DZzfd
	 QZg+txv9JhPLiwPRW3Vt7Ldjjcb2/a+XvwJXVR+zTq0TocT8btKAY7ZwTUXfbGAuKEc9x
	 vdl4eBlJuo2DCif9N6hCj4VMBPkGYdnsVeOC6bWnDeBmH+cRPVk8ISbagcPPvXckaVxe4
	 yyvGMAzaunWcYJCipsNl/TjlO5Wlvz4hKCeUZwAjiier0UL7i5ppdzyonFnAZo64YjttN
	 3Tsjyb0LcfBRxaG2GduyuG/3GL8/oFJ+RD2JhMl2Q9QlFtpWD5s5mt8oD50gjwMIHDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Oh9uyK+zgUUs1NZf18eljKmFFwEfCjAV2yBiPdAcC8=;
	b=jRJYyCmPQp9T/7CkfxGTZ71STdl8bmPfeOEvhSg8fikiwDOMq/SeHPuynZPl+w7naFMY
	 MxWMPp2Cz4wOYc9SSCnmiiX1+nGtdZwM08PORGQmonh3O8W5wwS/lbN3OQZg55u/7mO99
	 miNEVZ26nU8eEXt/3pMeFJtJ4a0kjPUACZTOI2jdJmFACgB32IycGDrUqfcATXinOUAqf
	 +9sGzWUEeBcGej+ZkPkdSuqCd2ErJsJjytZBHK5X+at7XcXRz4sutApyBf8rCXNqhFeun
	 p/Xni1WPaKJ4NeFjxUx3nzi8D8V6cioUUPGgReovRad0VXzBsX9rQ+xvdiLt3uc05Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkeK+ibR;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC8606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FkeK+ibR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso4861652eec.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727616; x=1795332416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Oh9uyK+zgUUs1NZf18eljKmFFwEfCjAV2yBiPdAcC8=;
        b=FkeK+ibR9dCaJiCV74mGCgve87dvWfw89XbutgWiDfFytSBs+dyLZqAqZ9xuE6+pMO
         6rL27Q/eFiVNqrQlrwnlsr46Z73iNaI50aiyJ4W+6KBey1+wOjo6dLLLKP6+4m0Ib5pT
         qyv3WwhgYPRmURFf/Kr6fnjOjlplw2/RumcuaP6LF+KWKyiT6iQnfowXeG5I+FyCKSzh
         VaKSWkyZewDCp/iHujjZUUZvpz5rCNq25FGvJniliTHVctPront7NC85QI5b3ZpbcBXP
         wCmdg0ZGZKplY8QEVtsYL31TAPs/mkMly69FTmiMgGXplpzy2Rmz5IjNXJPL7tvVU7be
         gMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727616; x=1795332416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Oh9uyK+zgUUs1NZf18eljKmFFwEfCjAV2yBiPdAcC8=;
        b=naSNKy2g45qzWrZFzWm5Wym4wtCutZg09fH3ak3g7OVl89vnIMZ/2ujHDR44qxJXAn
         gku0/uXgy5F6z/Q3JeAg8eInlZuTRoyq46CdiDbgAux7TWu/v/5mfA4ET6r2ImFzuBXs
         qPe4SER4eNcrj6SSCJOnNgXiE0/TrKHDTDTt1kqL5oQTzc/nb9nFNbIVuq4K9NxXOm9i
         PFznWi5nmFoyVJLKZQpMCSISdsap8LjFfvW2dRUsErdRdje4qfrJJK/Z2o6jKR6Z66/m
         6RIlg9JOjM9ZB+XJMtra4Y4+jTr922uRJb2WOc8ym46zf6rtrRRruiW7JX4ADdnt8oks
         A/+Q==
X-Gm-Message-State: APuU4Z8zvYCU+mEYqyZeZNiMDZtBTsNd4Dcr3vted0hdtSS1HdE0NsZ0
	6/H8MxKBFPYhoVgBY2qQG3bV5WuxZ0SG88gTKPKXkuEKcK6ev6JttH5nyxPhwI5c
X-Gm-Gg: AYBFou1gEz19E8qrqkZC95pMZ3mH04PgPV0bht+456oIoyE+Euej81jSqE3/JSFrk0P
	6R1j2OK8A8dj6OJmKDpbWki8lX/49bpetjbGhYdHjt0SHog11t7sV0ytpk9fnsn3Oj2fUSvXcvr
	KGo02vrEYbOASeotzwI+qR1Sc22BSEuOz5w7vL0raRSDmD5t6ivNahExq2Jgxp1LaHaXkNWP6r8
	WAyt4AlNBiUbU9dZ5jbL/6AmxfS7OR907K91yjkJpGjwmsXkemeX/RBXh0pUupvfeS6g7BdXClw
	+x/5muIrHBkK6w9GY4QFkkrjlFEF4KHFoGct7f5aBiph4YfLFdBWIdgiHhCmFjwJWRTnnoonjwf
	jMwcflw/xBNovetOqq5FutQZ74SHPm8/mMK8KZaX2DqOVNfKtkXWGwlZp56Hz2NIdVzzwgahq8x
	aia/4nN8WpIBIaFNei4vTEBJFeaO17Mh9VrzseP0KNUPNN/4Vxuz6n4NoJG/z8Zgcs1GWPgiQLU
	ASo1+QLcdvx8tptoqQauJFVGRnzJPcfdIHDflWxlP9ebNCBx6V0OOIGJe+dQHLJLlm8U/5N1bTm
	O21CXuhfIbh88nZ1sv2hIWgv
X-Received: by 2002:a05:7301:e8b:b0:37e:fac6:7ef1 with SMTP id 5a478bee46e88-37efac67fe5mr170110eec.39.1794727616310;
        Sat, 14 Nov 2026 23:26:56 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm22411234eec.3.2026.11.14.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:26:55 -0800 (PST)
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
Subject: [PATCH net-next v8 1/3] netlink: specs: add ovs_flow del and set operations
Date: Sun, 15 Nov 2026 02:26:36 -0500
Message-ID: <20261115072638.3163018-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115072638.3163018-1-houminxi@gmail.com>
References: <20261115072638.3163018-1-houminxi@gmail.com>
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

The ovs_flow spec described get and new only, so a YNL client could not
delete or modify a flow. Both commands have been in the kernel since the
family was added: del flushes the data path when a request carries neither
a key nor a ufid, or no key and a ufid longer than 16 octets, and set looks
a flow up by key or by ufid.

List the attributes each command reads, and say that a successful delete of
one flow, or a successful set, sends that flow to the family's multicast
group, as the kernel does. new and get read ufid-flags and probe as well as
the key, so those belong in their request lists. The get reply gains the
last-used time and the TCP flags, which ovs_flow_cmd_fill_stats() fills for
a get and for a dump reply. new, del and set need CAP_NET_ADMIN, and all
four operations skip strict and dump validation.

A dump reads ufid-flags alone, so give it a request list of its own instead
of sharing the get list. The reply stays the same as for get.

probe was binary while the kernel policy is NLA_FLAG, so a client that
wanted to raise it had to send an attribute with no body. As a flag the
generated setter takes no value.

The key, actions, stats, used and tcp-flags docs called those attributes
always present in notifications. The key is left out for a flow identified
by a ufid when the request asked for the key to be left out, and a dump
also leaves the actions out when they do not fit in the message. The other
three appear in replies as well, which the docs now say, and the uapi
comments for those attributes say the same.

The key doc said a key is required for every request except a dump. The
kernel accepts a ufid with no key, but a get and a set need one of the two,
and a set that replaces the actions needs a key. A new request needs a key,
including one that finds an existing flow and replaces its actions.

The header definition said a zero data path member leaves the request
non-specific, which no flow request accepts: each of them returns -ENODEV.
Drop that description.

The ufid doc promised that the flow is indexed by that value, which does
not hold for a value the kernel rejects. A value longer than 16 octets is
read as if the attribute were absent, so a new request indexes the flow by
its key instead, and a del that carries no key flushes the data path. A
zero length value fails the minimum length the policy sets. Record that
minimum, and limit the promise about indexing to a value the kernel
accepts. The doc also said the attribute appears in notifications only,
while a reply carries it too.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 Documentation/netlink/specs/ovs_flow.yaml | 110 +++++++++++++++++-----
 include/uapi/linux/openvswitch.h          |  35 ++++---
 2 files changed, 109 insertions(+), 36 deletions(-)

diff --git a/Documentation/netlink/specs/ovs_flow.yaml b/Documentation/netlink/specs/ovs_flow.yaml
index 951837b72e1d..98ef461535cd 100644
--- a/Documentation/netlink/specs/ovs_flow.yaml
+++ b/Documentation/netlink/specs/ovs_flow.yaml
@@ -18,9 +18,6 @@ definitions:
       -
         name: dp-ifindex
         type: u32
-        doc: |
-          ifindex of local port for datapath (0 to make a request not specific
-          to a datapath).
   -
     name: ovs-flow-stats
     type: struct
@@ -383,41 +380,50 @@ attribute-sets:
         type: nest
         nested-attributes: key-attrs
         doc: |
-          Nested attributes specifying the flow key. Always present in
-          notifications. Required for all requests (except dumps).
+          Nested attributes specifying the flow key. Present in replies and
+          notifications, except for a flow identified by a ufid when the
+          request asked for the key to be left out. A get, set or del may
+          carry a ufid instead of a key; a get and a set need one of the
+          two, and a set that replaces the actions needs a key. A new
+          request needs a key, including one that finds an existing flow and
+          replaces its actions. A del that carries neither a key nor a ufid
+          flushes the data path, and so does one that carries no key and a
+          ufid longer than 16 octets.
       -
         name: actions
         type: nest
         nested-attributes: action-attrs
         doc: |
           Nested attributes specifying the actions to take for packets that
-          match the key. Always present in notifications. Required for
-          OVS_FLOW_CMD_NEW requests, optional for OVS_FLOW_CMD_SET requests.  An
-          OVS_FLOW_CMD_SET without OVS_FLOW_ATTR_ACTIONS will not modify the
-          actions.  To clear the actions, an OVS_FLOW_ATTR_ACTIONS without any
-          nested attributes must be given.
+          match the key. Present in replies and notifications, except when
+          the request asked for the actions to be left out, and in a dump
+          when they do not fit in the message. Required for
+          OVS_FLOW_CMD_NEW requests, optional for OVS_FLOW_CMD_SET requests.
+          An OVS_FLOW_CMD_SET without OVS_FLOW_ATTR_ACTIONS will not modify
+          the actions. To clear the actions, an OVS_FLOW_ATTR_ACTIONS
+          without any nested attributes must be given.
       -
         name: stats
         type: binary
         struct: ovs-flow-stats
         doc: |
-          Statistics for this flow. Present in notifications if the stats would
-          be nonzero. Ignored in requests.
+          Statistics for this flow. Present in replies and notifications if
+          the stats would be nonzero. Ignored in requests.
       -
         name: tcp-flags
         type: u8
         doc: |
           An 8-bit value giving the ORed value of all of the TCP flags seen on
-          packets in this flow. Only present in notifications for TCP flows, and
-          only if it would be nonzero. Ignored in requests.
+          packets in this flow. Only present in replies and notifications for
+          TCP flows, and only if it would be nonzero. Ignored in requests.
       -
         name: used
         type: u64
         doc: |
           A 64-bit integer giving the time, in milliseconds on the system
           monotonic clock, at which a packet was last processed for this
-          flow. Only present in notifications if a packet has been processed for
-          this flow. Ignored in requests.
+          flow. Only present in replies and notifications if a packet has been
+          processed for this flow. Ignored in requests.
       -
         name: clear
         type: flag
@@ -438,18 +444,21 @@ attribute-sets:
           are exact match bits.
       -
         name: probe
-        type: binary
+        type: flag
         doc: |
           Flow operation is a feature probe, error logging should be suppressed.
       -
         name: ufid
         type: binary
+        checks:
+          min-len: 1
         doc: |
           A value between 1-16 octets specifying a unique identifier for the
           flow. Causes the flow to be indexed by this value rather than the
-          value of the OVS_FLOW_ATTR_KEY attribute. Optional for all
-          requests. Present in notifications if the flow was created with this
-          attribute.
+          value of the OVS_FLOW_ATTR_KEY attribute. A value longer than 16
+          octets is treated as if the attribute were absent, so a new flow is
+          indexed by its key. Optional for all requests. Present in replies
+          and notifications if the flow was created with this attribute.
         display-hint: uuid
       -
         name: ufid-flags
@@ -969,25 +978,77 @@ operations:
       doc: Get / dump OVS flow configuration and state
       value: 3
       attribute-set: flow-attrs
-      do: &flow-get-op
+      dont-validate: [strict, dump]
+      do:
         request:
           attributes:
             - key
             - ufid
             - ufid-flags
-        reply:
+            - probe
+        reply: &flow-get-reply
           attributes:
             - key
             - ufid
             - mask
+            - used
             - stats
+            - tcp-flags
             - actions
-      dump: *flow-get-op
+      dump:
+        request:
+          attributes:
+            - ufid-flags
+        reply: *flow-get-reply
     -
       name: new
       doc: Create OVS flow configuration in a data path
       value: 1
       attribute-set: flow-attrs
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - key
+            - ufid
+            - mask
+            - actions
+            - ufid-flags
+            - probe
+    -
+      name: del
+      doc: |
+        Delete one flow, or every flow in the data path. A request that
+        carries neither a key nor a ufid flushes the data path, and so does
+        one that carries no key and a ufid longer than 16 octets. A
+        successful delete of a single flow also sends that flow to the
+        family's multicast group, and to the requester when the request
+        sets NLM_F_ECHO; a flush sends nothing.
+      value: 2
+      attribute-set: flow-attrs
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
+      do:
+        request:
+          attributes:
+            - key
+            - ufid
+            - ufid-flags
+            - probe
+    -
+      name: set
+      doc: |
+        Modify an existing flow. The kernel rejects the request with
+        -EINVAL when it carries neither a key nor a ufid. Replacing the
+        actions also needs a key: a ufid on its own is not enough. A
+        successful set also sends the updated flow to the family's
+        multicast group, and to the requester when the request sets
+        NLM_F_ECHO.
+      value: 4
+      attribute-set: flow-attrs
+      dont-validate: [strict, dump]
+      flags: [uns-admin-perm]
       do:
         request:
           attributes:
@@ -995,6 +1056,9 @@ operations:
             - ufid
             - mask
             - actions
+            - ufid-flags
+            - clear
+            - probe
 
 mcast-groups:
   list:
diff --git a/include/uapi/linux/openvswitch.h b/include/uapi/linux/openvswitch.h
index 440825e65837..bd77e6fb4a95 100644
--- a/include/uapi/linux/openvswitch.h
+++ b/include/uapi/linux/openvswitch.h
@@ -624,24 +624,32 @@ struct ovs_nsh_key_md1 {
 /**
  * enum ovs_flow_attr - attributes for %OVS_FLOW_* commands.
  * @OVS_FLOW_ATTR_KEY: Nested %OVS_KEY_ATTR_* attributes specifying the flow
- * key.  Always present in notifications.  Required for all requests (except
- * dumps).
+ * key.  Present in replies and notifications, except for a flow identified
+ * by a ufid when the request asked for the key to be left out.  A get, set
+ * or del may carry a ufid instead of a key; a get and a set need one of the
+ * two, and a set that replaces the actions needs a key.  A new request needs
+ * a key, including one that finds an existing flow and replaces its
+ * actions.  A del carrying neither a key nor a ufid flushes the data path,
+ * as does one carrying no key and a ufid longer than 16 octets.
  * @OVS_FLOW_ATTR_ACTIONS: Nested %OVS_ACTION_ATTR_* attributes specifying
- * the actions to take for packets that match the key.  Always present in
- * notifications.  Required for %OVS_FLOW_CMD_NEW requests, optional for
+ * the actions to take for packets that match the key.  Present in replies
+ * and notifications, except when the request asked for the actions to be
+ * left out, and in a dump when they do not fit in the message.  Required
+ * for %OVS_FLOW_CMD_NEW requests, optional for
  * %OVS_FLOW_CMD_SET requests.  An %OVS_FLOW_CMD_SET without
  * %OVS_FLOW_ATTR_ACTIONS will not modify the actions.  To clear the actions,
  * an %OVS_FLOW_ATTR_ACTIONS without any nested attributes must be given.
  * @OVS_FLOW_ATTR_STATS: &struct ovs_flow_stats giving statistics for this
- * flow.  Present in notifications if the stats would be nonzero.  Ignored in
- * requests.
+ * flow.  Present in replies and notifications if the stats would be nonzero.
+ * Ignored in requests.
  * @OVS_FLOW_ATTR_TCP_FLAGS: An 8-bit value giving the OR'd value of all of the
- * TCP flags seen on packets in this flow.  Only present in notifications for
- * TCP flows, and only if it would be nonzero.  Ignored in requests.
+ * TCP flags seen on packets in this flow.  Only present in replies and
+ * notifications for TCP flows, and only if it would be nonzero.  Ignored in
+ * requests.
  * @OVS_FLOW_ATTR_USED: A 64-bit integer giving the time, in milliseconds on
  * the system monotonic clock, at which a packet was last processed for this
- * flow.  Only present in notifications if a packet has been processed for this
- * flow.  Ignored in requests.
+ * flow.  Only present in replies and notifications if a packet has been
+ * processed for this flow.  Ignored in requests.
  * @OVS_FLOW_ATTR_CLEAR: If present in a %OVS_FLOW_CMD_SET request, clears the
  * last-used time, accumulated TCP flags, and statistics for this flow.
  * Otherwise ignored in requests.  Never present in notifications.
@@ -655,9 +663,10 @@ struct ovs_nsh_key_md1 {
  * should be suppressed.
  * @OVS_FLOW_ATTR_UFID: A value between 1-16 octets specifying a unique
  * identifier for the flow. Causes the flow to be indexed by this value rather
- * than the value of the %OVS_FLOW_ATTR_KEY attribute. Optional for all
- * requests. Present in notifications if the flow was created with this
- * attribute.
+ * than the value of the %OVS_FLOW_ATTR_KEY attribute. A value longer than 16
+ * octets is treated as if the attribute were absent, so a new flow is indexed
+ * by its key. Optional for all requests. Present in replies and notifications
+ * if the flow was created with this attribute.
  * @OVS_FLOW_ATTR_UFID_FLAGS: A 32-bit value of OR'd %OVS_UFID_F_*
  * flags that provide alternative semantics for flow installation and
  * retrieval. Optional for all requests.
-- 
2.56.0

